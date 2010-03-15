#include "ruby.h"

RUBY_EXTERN VALUE rb_cISeq;
RUBY_EXTERN VALUE rb_iseq_load(VALUE data, VALUE parent, VALUE opt);

static VALUE
iseq_s_load(int argc, VALUE *argv, VALUE self)
{
    VALUE data, opt=Qnil;
    rb_scan_args(argc, argv, "11", &data, &opt);

    return rb_iseq_load(data, 0, opt);
}

void
Init_iseq(void)
{
    rb_define_const(rb_cObject, "ISeq", rb_cISeq);
    rb_define_singleton_method(rb_cISeq, "load", iseq_s_load, -1);
}
