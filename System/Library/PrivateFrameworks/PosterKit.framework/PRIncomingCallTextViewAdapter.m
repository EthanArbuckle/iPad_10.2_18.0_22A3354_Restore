@implementation PRIncomingCallTextViewAdapter

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController));
}

- (UIViewController)emojiViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController));
}

- (BOOL)statusIsHidden
{
  PRIncomingCallTextViewAdapter *v2;
  char v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.statusIsHidden.getter();

  return v3 & 1;
}

- (void)setStatusIsHidden:(BOOL)a3
{
  PRIncomingCallTextViewAdapter *v4;
  void (*v5)(_QWORD *);
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  _BYTE v9[152];
  _BYTE v10[152];

  v4 = self;
  swift_retain();
  v5 = sub_18B7199B8(v8);
  v7 = v6;
  sub_18B700E08(v6, (uint64_t)v9);
  sub_18B700E08((uint64_t)v9, (uint64_t)v10);
  if (sub_18B708DD4((uint64_t)v10) != 1)
    *(_BYTE *)(v7 + 32) = a3;
  ((void (*)(_QWORD *, _QWORD))v5)(v8, 0);

  swift_release();
}

- (CGRect)frame
{
  void *v2;
  PRIncomingCallTextViewAdapter *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_view);
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, sel_frame);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v5 = v11;
    v6 = v13;
    v7 = v15;
    v8 = v17;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PRIncomingCallTextViewAdapter *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  IncomingCallTextViewAdapter.frame.setter(x, y, width, height);

}

- (CGRect)tightFrame
{
  PRIncomingCallTextViewAdapter *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  IncomingCallTextViewAdapter.tightFrame.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)preferredAlignment
{
  PRIncomingCallTextViewAdapter *v2;
  unint64_t v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.preferredAlignment.getter();

  return v3;
}

- (void)setPreferredAlignment:(unint64_t)a3
{
  PRIncomingCallTextViewAdapter *v4;

  v4 = self;
  IncomingCallTextViewAdapter.preferredAlignment.setter(a3);

}

- (unint64_t)preferredLayout
{
  PRIncomingCallTextViewAdapter *v2;
  unint64_t v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.preferredLayout.getter();

  return v3;
}

- (void)setPreferredLayout:(unint64_t)a3
{
  PRIncomingCallTextViewAdapter *v4;

  v4 = self;
  IncomingCallTextViewAdapter.preferredLayout.setter(a3);

}

- (UIColor)textColor
{
  PRIncomingCallTextViewAdapter *v2;
  id v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.textColor.getter();

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4;
  PRIncomingCallTextViewAdapter *v5;

  v4 = a3;
  v5 = self;
  IncomingCallTextViewAdapter.textColor.setter(v4);

}

- (UIFont)emphasizedNameFont
{
  PRIncomingCallTextViewAdapter *v2;
  id v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.emphasizedNameFont.getter();

  return (UIFont *)v3;
}

- (void)setEmphasizedNameFont:(id)a3
{
  id v4;
  PRIncomingCallTextViewAdapter *v5;

  v4 = a3;
  v5 = self;
  IncomingCallTextViewAdapter.emphasizedNameFont.setter(v4);

}

- (UIFont)secondaryNameFont
{
  PRIncomingCallTextViewAdapter *v2;
  id v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.secondaryNameFont.getter();

  return (UIFont *)v3;
}

- (void)setSecondaryNameFont:(id)a3
{
  id v5;
  PRIncomingCallTextViewAdapter *v6;

  v5 = a3;
  v6 = self;
  IncomingCallTextViewAdapter.secondaryNameFont.setter(a3);

}

- (UIFont)statusFont
{
  PRIncomingCallTextViewAdapter *v2;
  id v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.statusFont.getter();

  return (UIFont *)v3;
}

- (void)setStatusFont:(id)a3
{
  id v5;
  PRIncomingCallTextViewAdapter *v6;

  v5 = a3;
  v6 = self;
  IncomingCallTextViewAdapter.statusFont.setter(a3);

}

- (NSString)displayNameText
{
  PRIncomingCallTextViewAdapter *v2;
  void *v3;

  v2 = self;
  IncomingCallTextViewAdapter.displayNameText.getter();

  v3 = (void *)sub_18B729358();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setDisplayNameText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PRIncomingCallTextViewAdapter *v7;

  v4 = sub_18B72937C();
  v6 = v5;
  v7 = self;
  IncomingCallTextViewAdapter.displayNameText.setter(v4, v6);

}

- (NSString)statusText
{
  PRIncomingCallTextViewAdapter *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  IncomingCallTextViewAdapter.statusText.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setStatusText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PRIncomingCallTextViewAdapter *v7;

  if (a3)
  {
    v4 = sub_18B72937C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  swift_retain();
  sub_18B71AD60(v4, v6);

  swift_release();
  swift_bridgeObjectRelease();
}

- (unint64_t)alignment
{
  PRIncomingCallTextViewAdapter *v2;
  char v3;

  v2 = self;
  swift_retain();
  v3 = sub_18B71A600();

  swift_release();
  return v3 & 1;
}

- (unint64_t)layout
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  PRIncomingCallTextViewAdapter *v6;
  unint64_t v7;
  uint64_t v9;

  v3 = sub_18B72922C();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  swift_retain();
  sub_18B71A988((uint64_t)v5);
  swift_release();
  v7 = sub_18B718EBC(v5);

  return v7;
}

- (BOOL)displayNameIsSuitableForVerticalLayout
{
  PRIncomingCallTextViewAdapter *v2;
  char v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.displayNameIsSuitableForVerticalLayout.getter();

  return v3 & 1;
}

- (BOOL)statusIsSuitableForVerticalLayout
{
  PRIncomingCallTextViewAdapter *v2;
  char v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.statusIsSuitableForVerticalLayout.getter();

  return v3 & 1;
}

- (BOOL)marqueeRunning
{
  PRIncomingCallTextViewAdapter *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  sub_18B728FE0();

  swift_release();
  swift_release();
  swift_release();
  return v5;
}

- (void)setMarqueeRunning:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FEC();
}

- (BOOL)multilineNameIsDisplayed
{
  PRIncomingCallTextViewAdapter *v2;
  BOOL v3;

  v2 = self;
  v3 = IncomingCallTextViewAdapter.multilineNameIsDisplayed.getter();

  return v3;
}

- (BOOL)callIsActive
{
  PRIncomingCallTextViewAdapter *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();

  return v5;
}

- (PRIncomingCallTextViewAdapter)initWithName:(id)a3
{
  void *v4;
  PRIncomingCallTextViewAdapter *v5;

  sub_18B72937C();
  v4 = (void *)sub_18B729358();
  swift_bridgeObjectRelease();
  v5 = -[PRIncomingCallTextViewAdapter initWithName:status:callIsActive:](self, sel_initWithName_status_callIsActive_, v4, 0, 0);

  return v5;
}

- (PRIncomingCallTextViewAdapter)initWithName:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  PRIncomingCallTextViewAdapter *v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = sub_18B72937C();
  v10 = v9;
  if (a4)
  {
    v11 = sub_18B72937C();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = sub_18B71BCD0(v8, v10, v11, v13, a5);
  v15 = objc_allocWithZone(ObjectType);
  v16 = (PRIncomingCallTextViewAdapter *)sub_18B717668(v14);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v16;
}

- (PRIncomingCallTextViewAdapter)initWithContact:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a5;
  if (a4)
  {
    v7 = sub_18B72937C();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  return (PRIncomingCallTextViewAdapter *)IncomingCallTextViewAdapter.init(contact:status:callIsActive:)(a3, v7, v9, v5);
}

- (PRIncomingCallTextViewAdapter)init
{
  PRIncomingCallTextViewAdapter *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController) = 0;

  result = (PRIncomingCallTextViewAdapter *)sub_18B729538();
  __break(1u);
  return result;
}

- (void)setTextFontUsingDefaultFontSizes:(id)a3
{
  id v4;
  PRIncomingCallTextViewAdapter *v5;

  v4 = a3;
  v5 = self;
  IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)((UIFont)v4);

}

- (void)transitionCallToActiveStateAnimated:(BOOL)a3
{
  PRIncomingCallTextViewAdapter *v4;

  v4 = self;
  IncomingCallTextViewAdapter.transitionCallToActiveState(animated:)(a3);

}

- (void)overrideTitleLayoutWith:(unint64_t)a3
{
  PRIncomingCallTextViewAdapter *v4;

  v4 = self;
  IncomingCallTextViewAdapter.overrideTitleLayout(with:)(a3);

}

- (void)removeTitleLayoutOverride
{
  PRIncomingCallTextViewAdapter *v2;

  v2 = self;
  IncomingCallTextViewAdapter.removeTitleLayoutOverride()();

}

- (CGSize)sizeThatFitsIn:(CGSize)a3
{
  void *v3;
  PRIncomingCallTextViewAdapter *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
  v4 = self;
  v5 = v3;
  sub_18B72910C();
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

- (void)posterAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  PRIncomingCallTextViewAdapter *v8;

  v4 = a3;
  v8 = self;
  v5 = objc_msgSend(v4, sel_font);
  IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)((UIFont)v5);

  v6 = objc_msgSend(v4, sel_labelColor);
  v7 = objc_msgSend(v6, sel_color);

  if (v7)
    IncomingCallTextViewAdapter.textColor.setter(v7);
  IncomingCallTextViewAdapter.preferredAlignment.setter((unint64_t)objc_msgSend(v4, sel_preferredTitleAlignment));
  IncomingCallTextViewAdapter.preferredLayout.setter((uint64_t)objc_msgSend(v4, sel_preferredTitleLayout));

}

@end
