@implementation _SEHostingHandle

- (_SEHostingHandle)init
{
  sub_245DC118C();
}

- (id)initFromXPCRepresentation:(id)a3
{
  swift_unknownObjectRetain();
  return _SEHostingHandle.init(from:)(a3);
}

- (id)xpcRepresentation
{
  _SEHostingHandle *v2;
  xpc_object_t empty;
  uint64_t v4;
  void *v5;
  id result;

  v2 = self;
  empty = xpc_dictionary_create_empty();
  v4 = *(unsigned int *)((char *)&v2->super.isa + OBJC_IVAR____SEHostingHandle_pid);
  if ((v4 & 0x80000000) != 0)
  {
    result = (id)sub_245DC4E5C();
    __break(1u);
  }
  else
  {
    v5 = empty;
    xpc_dictionary_set_uint64(empty, "pid", v4);
    xpc_dictionary_set_uint64(v5, "cid", *(unsigned int *)((char *)&v2->super.isa + OBJC_IVAR____SEHostingHandle_contextID));

    return v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SEHostingHandle)initWithCoder:(id)a3
{
  return (_SEHostingHandle *)_SEHostingHandle.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _SEHostingHandle *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *(unsigned int *)((char *)&self->super.isa + OBJC_IVAR____SEHostingHandle_pid);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_245DC4CAC();
  objc_msgSend(v5, sel_encodeInt32_forKey_, v4, v7);

  v8 = *(unsigned int *)((char *)&v6->super.isa + OBJC_IVAR____SEHostingHandle_contextID);
  v9 = (id)sub_245DC4CAC();
  objc_msgSend(v5, sel_encodeInt32_forKey_, v8, v9);

}

@end
