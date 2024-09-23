@implementation _VKStickerEffectViewInternal

- (BOOL)boundsIncludeStroke
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke;
  swift_beginAccess();
  *v4 = a3;
}

+ (double)extraScaleToIncludeStrokeWithEffectType:(int64_t)a3 bounds:(CGRect)a4
{
  double result;

  sub_249D887F0(a3, a4.size.width, a4.size.height);
  return result;
}

- (BOOL)reRenderOnMotion
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion;
  swift_beginAccess();
  return *v2;
}

- (void)setReRenderOnMotion:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion;
  swift_beginAccess();
  *v4 = a3;
}

- (float)curlPosition
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition);
  swift_beginAccess();
  return *v2;
}

- (void)setCurlPosition:(float)a3
{
  _VKStickerEffectViewInternal *v4;

  v4 = self;
  sub_249D833F0(a3);

}

- (_VKStickerEffectInternal)effect
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  return (_VKStickerEffectInternal *)*v2;
}

- (void)setEffect:(id)a3
{
  id v4;
  _VKStickerEffectViewInternal *v5;

  v4 = a3;
  v5 = self;
  sub_249D83634(v4);

}

- (VKStickerEffectInternal)_effect
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  return (VKStickerEffectInternal *)*v2;
}

- (void)set_effect:(id)a3
{
  uint64_t v4;
  void *v5;
  _VKStickerEffectViewInternal *v6;
  uint64_t v7;
  _VKStickerEffectViewInternal *v8;
  _VKStickerEffectViewInternal *v9;

  type metadata accessor for StickerEffect();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = (void *)v4;
    swift_unknownObjectRetain_n();
    v6 = self;
  }
  else
  {
    v7 = qword_2578D3BD8;
    swift_unknownObjectRetain();
    v8 = self;
    if (v7 != -1)
      swift_once();
    v6 = (_VKStickerEffectViewInternal *)qword_2578D3E40;
    v5 = (void *)qword_2578D3E40;
  }
  v9 = v6;
  sub_249D83634(v5);

  swift_unknownObjectRelease();
}

- (UIImage)image
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setImage:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _VKStickerEffectViewInternal *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_249D83D5C((uint64_t)v6);

}

- (BOOL)isPaused
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_isPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPaused:(BOOL)a3
{
  int v3;
  _BYTE *v5;
  int v6;
  _VKStickerEffectViewInternal *v7;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____VKStickerEffectViewInternal_isPaused;
  swift_beginAccess();
  v6 = *v5;
  *v5 = v3;
  if (v6 != v3)
  {
    v7 = self;
    sub_249D861A8();

  }
}

- (NSString)description
{
  _VKStickerEffectViewInternal *v2;
  void *v3;

  v2 = self;
  sub_249D841EC();

  v3 = (void *)sub_249D8B8B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_VKStickerEffectViewInternal)initWithDevice:(id)a3
{
  swift_unknownObjectRetain();
  return (_VKStickerEffectViewInternal *)StickerEffectView.init(device:)(a3);
}

- (_VKStickerEffectViewInternal)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s17VisionKitInternal17StickerEffectViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)scrollViewWillChange:(id)a3
{
  sub_249D85094(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_249D84DF4);
}

- (void)scrollViewDidChange:(id)a3
{
  sub_249D85094(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_249D84F5C);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  void *v5;
  id v6;
  id v7;
  objc_class *v8;
  objc_class *v9;
  _VKStickerEffectViewInternal *v10;

  if ((*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive) & 1) == 0)
  {
    v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_displayLink);
    v6 = v5;
    v7 = a3;
    v10 = self;
    sub_249D865DC(v5);
    v9 = v8;

    *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = v9;
    sub_249D861A8();

  }
}

- (CGSize)intrinsicContentSize
{
  id *v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v3 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  if (*v3)
  {
    objc_msgSend(*v3, sel_size);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)type metadata accessor for StickerEffectView();
    -[_VKStickerEffectViewInternal intrinsicContentSize](&v6, sel_intrinsicContentSize);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  _VKStickerEffectViewInternal *v2;

  v2 = self;
  sub_249D8535C();

}

- (void)didMoveToWindow
{
  _VKStickerEffectViewInternal *v2;

  v2 = self;
  sub_249D85610();

}

- (void)dealloc
{
  _VKStickerEffectViewInternal *v2;

  v2 = self;
  StickerEffectView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____VKStickerEffectViewInternal_logger;
  v4 = sub_249D8B864();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer));
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (void)playSettlingAnimation
{
  _VKStickerEffectViewInternal *v2;

  v2 = self;
  *(CFTimeInterval *)((char *)&v2->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime) = CACurrentMediaTime();
  sub_249D861A8();

}

- (void)_internalUpdateFromDisplayLink:(id)a3
{
  id v4;
  _VKStickerEffectViewInternal *v5;

  v4 = a3;
  v5 = self;
  sub_249D86320(v4);

}

- (void)snapshotWithCompletionHandler:(id)a3
{
  void *v4;
  _VKStickerEffectViewInternal *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_249D89648((char *)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_VKStickerEffectViewInternal)initWithFrame:(CGRect)a3
{
  _VKStickerEffectViewInternal *result;

  result = (_VKStickerEffectViewInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
