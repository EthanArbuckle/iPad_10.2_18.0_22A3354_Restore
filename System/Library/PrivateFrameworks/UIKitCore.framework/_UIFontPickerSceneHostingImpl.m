@implementation _UIFontPickerSceneHostingImpl

- (UIFontPickerViewController)delegateFontPickerViewController
{
  return (UIFontPickerViewController *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____UIFontPickerSceneHostingImpl_delegateFontPickerViewController, a2);
}

- (void)setDelegateFontPickerViewController:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)setupRemoteHosting
{
  _UIFontPickerSceneHostingImpl *v2;

  v2 = self;
  sub_185751A64();

}

- (void)setRemoteSelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4
{
  void *v5;
  _UIFontPickerSceneHostingImpl *v7;

  v5 = a3;
  if (a3)
  {
    sub_1851F9080(0, (unint64_t *)&unk_1EDD8A208);
    v5 = (void *)sub_186507654();
  }
  v7 = self;
  sub_185751FB0(v5, a4);

  swift_bridgeObjectRelease();
}

- (void)setHideNavigationBar:(BOOL)a3
{
  sub_185752118((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_actionForHideNavigationBar_);
}

- (void)setShowsGrabber:(BOOL)a3
{
  sub_185752118((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_actionForShowsGrabber_);
}

- (void)_pickerDidSelectFont:(id)a3
{
  id v4;
  _UIFontPickerSceneHostingImpl *v5;
  UIFontPickerViewController *v6;

  v4 = a3;
  v5 = self;
  v6 = -[_UIFontPickerSceneHostingImpl delegateFontPickerViewController](v5, sel_delegateFontPickerViewController);
  -[UIFontPickerViewController _pickerDidSelectFont:](v6, sel__pickerDidSelectFont_, v4);

}

- (void)_pickerDidCancel
{
  _UIFontPickerSceneHostingImpl *v2;
  UIFontPickerViewController *v3;

  v2 = self;
  v3 = -[_UIFontPickerSceneHostingImpl delegateFontPickerViewController](v2, sel_delegateFontPickerViewController);
  -[UIFontPickerViewController _pickerDidCancel](v3, sel__pickerDidCancel);

}

- (void)clientIsReady
{
  UIFontPickerViewController *v2;
  _UIFontPickerSceneHostingImpl *v3;
  _UIFontPickerSceneHostingImpl *v4;
  _UIFontPickerSceneHostingImpl *v5;

  v5 = self;
  v2 = -[_UIFontPickerSceneHostingImpl delegateFontPickerViewController](v5, sel_delegateFontPickerViewController);
  if (v2)
  {
    v3 = (_UIFontPickerSceneHostingImpl *)v2;
    -[UIViewController _endDelayingPresentation](v2, sel__endDelayingPresentation);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy();
}

- (_UIFontPickerSceneHostingImpl)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFontPickerSceneHostingImpl_hostingController) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)_UIFontPickerSceneHostingImpl;
  return -[_UIFontPickerSceneHostingImpl init](&v4, sel_init);
}

@end
