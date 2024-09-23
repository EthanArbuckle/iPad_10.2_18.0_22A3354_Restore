@implementation StoryThumbnailImageGenerator.Request

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  LOBYTE(self) = sub_1A6DDC53C(v8, v9, v10);

  return self & 1;
}

- (void)engineSetNeedsUpdate:(id)a3
{
  if (*((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_waitingForResources) == 1)
    objc_msgSend(a3, sel_updateIfNeeded);
}

- (_TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request)init
{
  _TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request *result;

  result = (_TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyTraitCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyLayout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_engine));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_pixelBufferRenderDestination));
}

@end
