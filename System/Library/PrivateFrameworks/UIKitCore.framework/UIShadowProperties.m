@implementation UIShadowProperties

- (UIShadowProperties)init
{
  void *v3;
  UIShadowProperties *v4;
  id v5;
  char *v6;
  objc_super v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_blackColor);
  v6 = (char *)v4 + OBJC_IVAR___UIShadowProperties__backingProperties;
  *(_QWORD *)v6 = v5;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *((_QWORD *)v6 + 7) = 0;

  v8.receiver = v4;
  v8.super_class = (Class)UIShadowProperties;
  return -[UIShadowProperties init](&v8, sel_init);
}

- (UIColor)color
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setColor:(id)a3
{
  char *v5;
  void *v6;
  id v7;
  UIShadowProperties *v8;
  uint64_t v9;

  v5 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  v6 = *(void **)v5;
  v7 = a3;
  v8 = self;

  *(_QWORD *)v5 = v7;
  v9 = *((_QWORD *)v5 + 6);
  if ((v9 & 1) == 0)
    *((_QWORD *)v5 + 6) = v9 | 1;
  swift_endAccess();

}

- (void)set_color:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (double)opacity
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return v2[1];
}

- (void)setOpacity:(double)a3
{
  double *v4;
  uint64_t v5;

  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[1] = a3;
  v5 = *((_QWORD *)v4 + 6);
  if ((v5 & 2) == 0)
    *((_QWORD *)v4 + 6) = v5 | 2;
}

- (void)set_opacity:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[1] = a3;
}

- (double)radius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return v2[2];
}

- (void)setRadius:(double)a3
{
  double *v4;
  uint64_t v5;

  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[2] = a3;
  v5 = *((_QWORD *)v4 + 6);
  if ((v5 & 4) == 0)
    *((_QWORD *)v4 + 6) = v5 | 4;
}

- (void)set_radius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v4[2] = a3;
}

- (void)setOffset:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;
  uint64_t v6;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v5[3] = width;
  v5[4] = height;
  v6 = *((_QWORD *)v5 + 6);
  if ((v6 & 8) == 0)
    *((_QWORD *)v5 + 6) = v6 | 8;
}

- (double)offset
{
  uint64_t v1;

  v1 = a1 + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  return *(double *)(v1 + 24);
}

- (void)set_offset:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  v5[3] = width;
  v5[4] = height;
}

- (UIBezierPath)path
{
  UIShadowProperties *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_185775DA8();

  return (UIBezierPath *)v3;
}

- (void)setPath:(id)a3
{
  id v5;
  UIShadowProperties *v6;

  v5 = a3;
  v6 = self;
  sub_185775EB0(a3);

}

- (UIBezierPath)_path
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIShadowProperties__backingProperties);
  swift_beginAccess();
  return (UIBezierPath *)v2[5];
}

- (void)set_path:(id)a3
{
  char *v4;
  void *v5;
  id v6;

  v4 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  v5 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = a3;
  v6 = a3;

}

- (int64_t)_backgroundConfigurationShadowType
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  return *((_QWORD *)v2 + 7);
}

- (void)set_backgroundConfigurationShadowType:(int64_t)a3
{
  char *v4;

  v4 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  *((_QWORD *)v4 + 7) = a3;
}

- (void)_applyPropertiesFromDefaultProperties:(id)a3
{
  char *v5;
  uint64_t v6;
  __int128 v7;
  id v8;
  id v9;
  UIShadowProperties *v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = (char *)a3 + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 7);
  v12 = *(id *)v5;
  v7 = *(_OWORD *)(v5 + 24);
  v13 = *(_OWORD *)(v5 + 8);
  v14 = v7;
  v15 = *(_OWORD *)(v5 + 40);
  v16 = v6;
  swift_beginAccess();
  v8 = (id)v15;
  v9 = a3;
  v10 = self;
  v11 = v12;
  sub_185774BF0((uint64_t)&v12);
  swift_endAccess();

}

- (BOOL)isEqual:(id)a3
{
  UIShadowProperties *v4;
  UIShadowProperties *v5;
  BOOL v6;
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
  v6 = UIShadowProperties.isEqual(_:)((uint64_t)v8);

  sub_1855BDE94((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  UIShadowProperties *v2;
  void *v3;

  v2 = self;
  UIShadowProperties.description.getter();

  v3 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  UIShadowProperties *v13;
  id v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;
  __int128 v20;

  v4 = (char *)self + OBJC_IVAR___UIShadowProperties__backingProperties;
  swift_beginAccess();
  v5 = *(void **)v4;
  v20 = *(_OWORD *)(v4 + 8);
  v6 = *((_QWORD *)v4 + 3);
  v7 = *((_QWORD *)v4 + 4);
  v8 = (void *)*((_QWORD *)v4 + 5);
  v9 = *((_QWORD *)v4 + 6);
  v10 = *((_QWORD *)v4 + 7);
  v11 = objc_allocWithZone((Class)UIShadowProperties);
  v12 = v8;
  v13 = self;
  v14 = v5;
  v15 = (char *)objc_msgSend(v11, sel_init);
  v16 = &v15[OBJC_IVAR___UIShadowProperties__backingProperties];
  swift_beginAccess();
  v17 = *(void **)v16;
  v18 = (void *)*((_QWORD *)v16 + 5);
  *(_QWORD *)v16 = v14;
  *(_OWORD *)(v16 + 8) = v20;
  *((_QWORD *)v16 + 3) = v6;
  *((_QWORD *)v16 + 4) = v7;
  *((_QWORD *)v16 + 5) = v8;
  *((_QWORD *)v16 + 6) = v9;
  *((_QWORD *)v16 + 7) = v10;

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIShadowProperties)initWithCoder:(id)a3
{
  id v3;
  UIShadowProperties *v4;

  v3 = a3;
  v4 = (UIShadowProperties *)sub_185776B14(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIShadowProperties *v5;

  v4 = a3;
  v5 = self;
  sub_185776678(v4);

}

- (void).cxx_destruct
{
  id v2;

  v2 = *(id *)&self->_backingProperties[OBJC_IVAR___UIShadowProperties__backingProperties + 32];

}

@end
