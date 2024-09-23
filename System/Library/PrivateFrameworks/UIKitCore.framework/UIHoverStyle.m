@implementation UIHoverStyle

- (void)_invalidateAutomaticHoverEffect
{
  UIHoverStyle *v2;

  v2 = self;
  sub_185227960(0, (uint64_t)sub_1852283C4, 0);

}

- (id)copyWithZone:(void *)a3
{
  UIHoverStyle *v3;
  void *v4;
  char *v6[4];

  v3 = self;
  sub_1851E6B44(v6);

  __swift_project_boxed_opaque_existential_0Tm(v6, (uint64_t)v6[3]);
  v4 = (void *)sub_186507FB4();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (BOOL)isEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___UIHoverStyle__isEnabled);
}

- (void)setEnabled:(BOOL)enabled
{
  uint64_t v4;
  int v5;
  char v6;
  uint64_t v7;
  UIHoverStyle *v8;

  v4 = OBJC_IVAR___UIHoverStyle__isEnabled;
  v5 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___UIHoverStyle__isEnabled);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___UIHoverStyle__isEnabled) = enabled;
  v8 = self;
  if (v5 == -[UIHoverStyle isEnabled](v8, sel_isEnabled))
  {

  }
  else
  {
    v6 = *((_BYTE *)&self->super.isa + v4);
    v7 = swift_allocObject();
    *(_BYTE *)(v7 + 16) = v6;
    sub_185227960(0, (uint64_t)sub_18578AEE4, v7);

    swift_release();
  }
}

- (UIHoverStyle)init
{
  return (UIHoverStyle *)sub_1851E7D5C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR___UIHoverStyle__effect);

  sub_185223490(*(void **)((char *)&self->super.isa + OBJC_IVAR___UIHoverStyle__shape), *(_QWORD *)&self->_cachedBridgedEffect[OBJC_IVAR___UIHoverStyle__shape], *(_QWORD *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape], *(_QWORD *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 8], *(_QWORD *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 16], *(_QWORD *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 24], *(_QWORD *)&self->_effect[OBJC_IVAR___UIHoverStyle__shape + 32], self->_cachedBridgedShape[OBJC_IVAR___UIHoverStyle__shape]);
  sub_18519F088((uint64_t)self + OBJC_IVAR___UIHoverStyle_host, &qword_1EDD81A30);
  sub_18519F088((uint64_t)self + OBJC_IVAR___UIHoverStyle_driverCoordinator, &qword_1EDD81F98);
  swift_bridgeObjectRelease();
}

- (void)_invalidateAutomaticHoverShape
{
  UIHoverStyle *v2;

  v2 = self;
  sub_185227960(0, (uint64_t)sub_1851E7054, 0);

}

- (id)effect
{
  UIHoverStyle *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_18578900C();

  return v3;
}

- (void)setEffect:(id)effect
{
  UIHoverStyle *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_185789124((uint64_t)effect);

}

- (UIShape)shape
{
  UIHoverStyle *v2;
  char *v3;

  v2 = self;
  v3 = sub_1857892B4();

  return (UIShape *)v3;
}

- (void)setShape:(UIShape *)shape
{
  UIHoverStyle *v5;
  UIShape *v6;

  v6 = shape;
  v5 = self;
  sub_18578AD08(shape);

}

- (UIHoverStyle)styleWithEffect:(id)a3 shape:(id)a4
{
  id v6;
  id v7;
  UIHoverStyle *v8;

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromObject());
  swift_unknownObjectRetain();
  v7 = a4;
  v8 = (UIHoverStyle *)objc_msgSend(v6, sel_init);
  -[UIHoverStyle setEffect:](v8, sel_setEffect_, a3);
  -[UIHoverStyle setShape:](v8, sel_setShape_, v7);
  swift_unknownObjectRelease();

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (UIHoverStyle)styleWithShape:(id)a3
{
  id v4;
  id v5;
  UIHoverStyle *v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromObject());
  v5 = a3;
  v6 = (UIHoverStyle *)objc_msgSend(v4, sel_init);
  -[UIHoverStyle setShape:](v6, sel_setShape_, v5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

+ (UIHoverStyle)styleWithEffect:(id)effect shape:(UIShape *)shape
{
  id v6;
  UIShape *v7;
  id v8;

  v6 = objc_allocWithZone((Class)UIHoverStyle);
  swift_unknownObjectRetain();
  v7 = shape;
  v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setEffect_, effect);
  objc_msgSend(v8, sel_setShape_, v7);
  swift_unknownObjectRelease();

  return (UIHoverStyle *)v8;
}

+ (UIHoverStyle)styleWithShape:(UIShape *)shape
{
  id v4;
  UIShape *v5;
  id v6;

  v4 = objc_allocWithZone((Class)UIHoverStyle);
  v5 = shape;
  v6 = objc_msgSend(v4, sel_init);
  objc_msgSend(v6, sel_setShape_, v5);

  return (UIHoverStyle *)v6;
}

+ (UIHoverStyle)automaticStyle
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)UIHoverStyle), sel_init);
  objc_msgSend(v2, sel_setShape_, 0);
  return (UIHoverStyle *)v2;
}

- (BOOL)isEqual:(id)a3
{
  UIHoverStyle *v4;
  UIHoverStyle *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = UIHoverStyle.isEqual(_:)((uint64_t)v8);

  sub_18519F088((uint64_t)v8, &qword_1ECD75B20);
  return v6 & 1;
}

- (NSString)description
{
  return (NSString *)sub_18578A36C(self, (uint64_t)a2, (void (*)(void))UIHoverStyle.description.getter);
}

- (NSString)verboseDescription
{
  return (NSString *)sub_18578A36C(self, (uint64_t)a2, (void (*)(void))sub_18578A3C4);
}

@end
