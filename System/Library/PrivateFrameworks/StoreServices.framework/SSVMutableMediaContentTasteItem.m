@implementation SSVMutableMediaContentTasteItem

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SSVMediaContentTasteItem _copyWithMediaContentTasteItemClass:](self, "_copyWithMediaContentTasteItemClass:", objc_opt_class());
}

- (void)setContentType:(unint64_t)a3
{
  self->super._contentType = a3;
}

- (void)setPlaylistGlobalID:(id)a3
{
  NSString *v4;
  NSString *playlistGlobalID;

  if (self->super._playlistGlobalID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    playlistGlobalID = self->super._playlistGlobalID;
    self->super._playlistGlobalID = v4;

  }
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->super._storeAdamID = a3;
}

- (void)setTasteType:(unint64_t)a3
{
  self->super._tasteType = a3;
}

@end
