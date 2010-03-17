#include "ruby.h"
#ifndef ISEQ_LOAD
#define ISEQ_LOAD rb_iseq_load
#endif

RUBY_EXTERN VALUE rb_cISeq;

#ifdef OLD_ISEQ_LOAD
RUBY_EXTERN VALUE iseq_load(VALUE self, VALUE data, VALUE parent, VALUE opt);
static inline VALUE
ISEQ_LOAD(VALUE data, VALUE parent, VALUE opt)
{
    iseq_load(rb_cISeq, data, parent, opt);
}
#else
RUBY_EXTERN VALUE ISEQ_LOAD(VALUE data, VALUE parent, VALUE opt);
#endif

static VALUE
iseq_s_load(int argc, VALUE *argv, VALUE self)
{
    VALUE data, opt=Qnil;
    rb_scan_args(argc, argv, "11", &data, &opt);

    return ISEQ_LOAD(data, 0, opt);
}

void
Init_iseq(void)
{
    rb_define_const(rb_cObject, "ISeq", rb_cISeq);
    rb_define_singleton_method(rb_cISeq, "load", iseq_s_load, -1);
}
