@implementation PLCommentsFontCache

- (PLCommentsFontCache)init
{
  PLCommentsFontCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCommentsFontCache;
  v2 = -[PLCommentsFontCache init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contentSizesDidChange_, *MEMORY[0x1E0CEB3F0], 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PLCommentsFontCache;
  -[PLCommentsFontCache dealloc](&v3, sel_dealloc);
}

- (void)_contentSizesDidChange:(id)a3
{
  -[PLCommentsFontCache _invalidateCache](self, "_invalidateCache", a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PLCommentsFontCacheDidChangeNotification"), self);
}

- (void)_invalidateCache
{

  self->__shortCaptionFontDescriptor = 0;
  self->__emphasizedShortCaptionFontDescriptor = 0;

  self->__shortSubheadlineFontDescriptor = 0;
  self->__bodyFontDescriptor = 0;

  self->__emphasizedBodyFontDescriptor = 0;
  self->__shortBodyFontDescriptor = 0;
}

- (id)_shortCaptionFontDescriptor
{
  id result;

  result = self->__shortCaptionFontDescriptor;
  if (!result)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB548], 0, 0);
    self->__shortCaptionFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_emphasizedShortCaptionFontDescriptor
{
  id result;

  result = self->__emphasizedShortCaptionFontDescriptor;
  if (!result)
  {
    result = (id)objc_msgSend(-[PLCommentsFontCache _shortCaptionFontDescriptor](self, "_shortCaptionFontDescriptor"), "fontDescriptorWithSymbolicTraits:", 2);
    self->__emphasizedShortCaptionFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_shortSubheadlineFontDescriptor
{
  id result;

  result = self->__shortSubheadlineFontDescriptor;
  if (!result)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB590], 0x8000, 0);
    self->__shortSubheadlineFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_bodyFontDescriptor
{
  id result;

  result = self->__bodyFontDescriptor;
  if (!result)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB538], 0, 0);
    self->__bodyFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_emphasizedBodyFontDescriptor
{
  id result;

  result = self->__emphasizedBodyFontDescriptor;
  if (!result)
  {
    result = (id)objc_msgSend(-[PLCommentsFontCache _bodyFontDescriptor](self, "_bodyFontDescriptor"), "fontDescriptorWithSymbolicTraits:", 2);
    self->__emphasizedBodyFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (id)_shortBodyFontDescriptor
{
  id result;

  result = self->__shortBodyFontDescriptor;
  if (!result)
  {
    result = (id)objc_msgSend(-[PLCommentsFontCache _bodyFontDescriptor](self, "_bodyFontDescriptor"), "fontDescriptorWithSymbolicTraits:", 0x8000);
    self->__shortBodyFontDescriptor = (UIFontDescriptor *)result;
  }
  return result;
}

- (UIFont)youLikeFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", -[PLCommentsFontCache _emphasizedShortCaptionFontDescriptor](self, "_emphasizedShortCaptionFontDescriptor"), 0.0);
}

- (UIFont)likeFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", -[PLCommentsFontCache _shortCaptionFontDescriptor](self, "_shortCaptionFontDescriptor"), 0.0);
}

- (UIFont)commentTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", -[PLCommentsFontCache _shortSubheadlineFontDescriptor](self, "_shortSubheadlineFontDescriptor"), 0.0);
}

- (UIFont)commentAttributionDateFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", -[PLCommentsFontCache _shortCaptionFontDescriptor](self, "_shortCaptionFontDescriptor"), 0.0);
}

- (UIFont)commentAttributionNameFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", -[PLCommentsFontCache _emphasizedShortCaptionFontDescriptor](self, "_emphasizedShortCaptionFontDescriptor"), 0.0);
}

- (UIFont)commentEntryFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", -[PLCommentsFontCache _shortBodyFontDescriptor](self, "_shortBodyFontDescriptor"), 0.0);
}

- (UIFont)commentSendButtonFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", -[PLCommentsFontCache _emphasizedBodyFontDescriptor](self, "_emphasizedBodyFontDescriptor"), 0.0);
}

+ (id)sharedCache
{
  pl_dispatch_once();
  return (id)sharedCache_sharedCache;
}

PLCommentsFontCache *__34__PLCommentsFontCache_sharedCache__block_invoke()
{
  PLCommentsFontCache *result;

  result = objc_alloc_init(PLCommentsFontCache);
  sharedCache_sharedCache = (uint64_t)result;
  return result;
}

@end
