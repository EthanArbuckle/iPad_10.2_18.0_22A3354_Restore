@implementation UpNextQueueButton

- (_TtC9SeymourUI17UpNextQueueButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17UpNextQueueButton *)sub_22B0FFA20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17UpNextQueueButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B531EB8();
}

- (void)primaryActionTriggered:(id)a3
{
  id v4;
  _TtC9SeymourUI17UpNextQueueButton *v5;

  v4 = a3;
  v5 = self;
  sub_22B5313C8((uint64_t)v4);

}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[12];
  uint64_t v10;

  v3 = *(_OWORD *)((char *)&self->super.super.super._viewBackingAux
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[10] = *(_OWORD *)((char *)&self->super.super.super._minimumSafeAreaInsets.right
                     + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[11] = v3;
  v10 = *(uint64_t *)((char *)&self->super.super.super._minYVariable
                   + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v4 = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider
                 + 8);
  v9[6] = *(_OWORD *)((char *)&self->super.super.super._viewDelegate
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[7] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._minimumSafeAreaInsets.left
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[8] = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider
                    + 24);
  v9[9] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.super._swiftAnimationInfo
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[2] = *(_OWORD *)((char *)&self->super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[3] = v6;
  v7 = *(_OWORD *)((char *)&self->super.super.super._window + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[4] = *(_OWORD *)((char *)&self->super.super.super._layerRetained
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[5] = v7;
  v8 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[1] = v8;
  sub_22B531FDC((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_visualEffectView));
}

@end
