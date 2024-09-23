@implementation _SEInternalGrant

- (void).cxx_destruct
{
  id v2;

  v2 = *(id *)&self->inner[OBJC_IVAR____TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant_inner];
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant_inner));

}

- (BOOL)invalidateWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;

  _Capability.Grant.invalidate()();
  if (v4)
  {
    if (a3)
    {
      v5 = (void *)sub_245DC4A18();

      v6 = v5;
      *a3 = v5;
    }
    else
    {

    }
  }
  return v4 == 0;
}

- (BOOL)isValid
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant_inner), sel_isValid);
}

- (_TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant)init
{
  _TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant *result;

  result = (_TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
