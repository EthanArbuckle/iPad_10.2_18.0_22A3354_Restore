@implementation CRLUSDRenderingExtensionConnector.ViewControllerDelegate

- (_TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (char *)self
     + OBJC_IVAR____TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate_continuation;
  v5 = sub_1004B804C(&qword_1013EB680);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[CRLUSDRenderingExtensionConnector.ViewControllerDelegate init](&v7, "init");
}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6;
  id v7;
  _TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1008B61A0();

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6;
  _TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1008B6334((uint64_t)a4);

}

- (void).cxx_destruct
{
  sub_1004CB800((uint64_t)self+ OBJC_IVAR____TtCC8Freeform33CRLUSDRenderingExtensionConnectorP33_3F2C14ED993E13602DE61854D66D868F22ViewControllerDelegate_continuation, &qword_1013F8218);
}

@end
