@implementation UITextFormattingKeyboardSession

- (void)setFormattingDescriptor:(id)a3
{
  uint64_t v4;
  UITextFormattingKeyboardSession *v5;
  _OWORD v6[9];
  _BYTE v7[144];

  if (a3)
  {
    static UITextFormattingViewController.FormattingDescriptor._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
    signpost_c2_removePresentationModifier_end(v6, v4);
  }
  else
  {
    sub_1856D6884(v6);
  }
  sub_1850F26F8((uint64_t)v6, (uint64_t)v7, (uint64_t *)&unk_1EDD884D8);
  sub_1850F26F8((uint64_t)v7, (uint64_t)v6, (uint64_t *)&unk_1EDD884D8);
  v5 = self;
  sub_1856CF2F8((uint64_t)v6);

  sub_1856D68A0((uint64_t)v7);
}

- (id)_textFormattingResponder
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x186DCA138]((char *)self + OBJC_IVAR___UISubstituteKeyboardSession_responder, a2);
  if (v2)
  {
    v3 = v2;
    v2 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (!v2)
    {

      v2 = 0;
    }
  }
  return v2;
}

- (id)_textFormattingViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR___UITextFormattingKeyboardSession_textFormattingViewController));
}

- (UITextFormattingKeyboardSession)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___UITextFormattingKeyboardSession_textFormattingViewController) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[UISubstituteKeyboardSession init](&v5, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___UITextFormattingKeyboardSession_textFormattingViewController));
}

@end
