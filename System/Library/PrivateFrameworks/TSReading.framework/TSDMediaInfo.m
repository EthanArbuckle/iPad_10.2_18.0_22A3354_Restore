@implementation TSDMediaInfo

- (TSDMediaInfo)initWithContext:(id)a3 geometry:(id)a4
{
  TSDMediaInfo *v4;
  TSDMediaInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDMediaInfo;
  v4 = -[TSDDrawableInfo initWithContext:geometry:](&v7, sel_initWithContext_geometry_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->super.super.mAspectRatioLocked = 1;
    -[TSDMediaInfo defaultOriginalSize](v4, "defaultOriginalSize");
    -[TSDMediaInfo setOriginalSize:](v5, "setOriginalSize:");
  }
  return v5;
}

- (id)copyWithContext:(id)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMediaInfo;
  result = -[TSDDrawableInfo copyWithContext:](&v5, sel_copyWithContext_, a3);
  if (result)
  {
    *((_OWORD *)result + 9) = self->mOriginalSize;
    *((_DWORD *)result + 40) = self->mFlags;
  }
  return result;
}

- (void)setOriginalSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_mOriginalSize;

  height = a3.height;
  width = a3.width;
  p_mOriginalSize = &self->mOriginalSize;
  if (self->mOriginalSize.width != a3.width || self->mOriginalSize.height != a3.height)
  {
    -[TSPObject willModify](self, "willModify");
    p_mOriginalSize->width = width;
    p_mOriginalSize->height = height;
  }
}

- (CGSize)defaultOriginalSize
{
  double v2;
  double v3;
  CGSize result;

  -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](self, "geometry"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (unsigned)flags
{
  return *(_BYTE *)&self->mFlags & 3;
}

- (void)setFlags:(unsigned int)a3
{
  char v3;

  v3 = a3;
  -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 527);
  -[TSPObject willModify](self, "willModify");
  *(_BYTE *)&self->mFlags = *(_BYTE *)&self->mFlags & 0xFC | v3 & 3;
}

- (BOOL)isPlaceholder
{
  return *(_BYTE *)&self->mFlags & 1;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  *(_BYTE *)&self->mFlags = *(_BYTE *)&self->mFlags & 0xFE | a3;
}

- (BOOL)wasMediaReplaced
{
  return (*(_BYTE *)&self->mFlags >> 1) & 1;
}

- (void)setWasMediaReplaced:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->mFlags = *(_BYTE *)&self->mFlags & 0xFD | v3;
}

- (void)setGeometry:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMediaInfo;
  -[TSDDrawableInfo setGeometry:](&v5, sel_setGeometry_);
  objc_msgSend(a3, "size");
  -[TSDMediaInfo setOriginalSize:](self, "setOriginalSize:");
}

- (NSString)mediaDisplayName
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMediaInfo mediaDisplayName]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaInfo.m"), 112, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDMediaInfo mediaDisplayName]"), 0));
}

- (NSString)mediaFileType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMediaInfo mediaFileType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaInfo.m"), 119, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDMediaInfo mediaFileType]"), 0));
}

- (CGSize)rawDataSize
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMediaInfo rawDataSize]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaInfo.m"), 125, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDMediaInfo rawDataSize]"), 0));
}

- (void)takePropertiesFromReplacedMediaInfo:(id)a3
{
  -[TSDMediaInfo updateGeometryToReplaceMediaInfo:](self, "updateGeometryToReplaceMediaInfo:");
  objc_msgSend(a3, "originalSize");
  -[TSDMediaInfo setOriginalSize:](self, "setOriginalSize:");
  -[TSDMediaInfo setIsPlaceholder:](self, "setIsPlaceholder:", objc_msgSend(a3, "isPlaceholder"));
  -[TSDMediaInfo setWasMediaReplaced:](self, "setWasMediaReplaced:", 1);
  -[TSDStyledInfo setStyle:](self, "setStyle:", objc_msgSend(a3, "style"));
  if (-[TSDDrawableInfo supportsAttachedComments](self, "supportsAttachedComments"))
    -[TSDDrawableInfo setComment:](self, "setComment:", objc_msgSend(a3, "comment"));
  -[TSDDrawableInfo setExteriorTextWrap:](self, "setExteriorTextWrap:", objc_msgSend(a3, "exteriorTextWrap"));
  -[TSDDrawableInfo setAspectRatioLocked:](self, "setAspectRatioLocked:", objc_msgSend(a3, "aspectRatioLocked"));
  -[TSDDrawableInfo setHyperlinkURL:](self, "setHyperlinkURL:", objc_msgSend(a3, "hyperlinkURL"));
}

- (void)updateGeometryToReplaceMediaInfo:(id)a3
{
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
  double v15;
  id v17;

  v17 = (id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "mutableCopy");
  objc_msgSend(a3, "centerForReplacingWithNewMedia");
  v6 = v5;
  v8 = v7;
  -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](self, "geometry"), "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(a3, "originalSize");
  if (TSDShrinkSizeToFitInSize(v10, v12, v13, v14) == *MEMORY[0x24BDBF148]
    && v15 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](self, "geometry"), "size");
  }
  objc_msgSend(v17, "setSize:");
  objc_msgSend(v17, "setCenter:", v6, v8);
  -[TSDMediaInfo setGeometry:](self, "setGeometry:", v17);

}

- (CGPoint)centerForReplacingWithNewMedia
{
  double v2;
  double v3;
  CGPoint result;

  -[TSDInfoGeometry center](-[TSDDrawableInfo geometry](self, "geometry"), "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGSize)originalSize
{
  double width;
  double height;
  CGSize result;

  width = self->mOriginalSize.width;
  height = self->mOriginalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
