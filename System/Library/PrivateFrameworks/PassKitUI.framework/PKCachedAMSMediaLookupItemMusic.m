@implementation PKCachedAMSMediaLookupItemMusic

- (PKCachedAMSMediaLookupItemMusic)initWithMusicLookupItem:(id)a3
{
  id v5;
  PKCachedAMSMediaLookupItemMusic *v6;
  PKCachedAMSMediaLookupItemMusic *v7;
  PKCachedAMSMediaLookupItemMusic *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCachedAMSMediaLookupItemMusic;
    v6 = -[PKCachedAMSMediaLookupItemMusic init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_musicItem, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)beginContentAccess
{
  BOOL v2;

  v2 = self->_musicItem != 0;
  self->_contentBeingAcccessed = v2;
  return v2;
}

- (void)discardContentIfPossible
{
  PKAMSMediaLookupItemMusic *musicItem;

  musicItem = self->_musicItem;
  self->_musicItem = 0;

}

- (void)endContentAccess
{
  self->_contentBeingAcccessed = 0;
}

- (BOOL)isContentDiscarded
{
  return self->_musicItem == 0;
}

- (PKAMSMediaLookupItemMusic)musicItem
{
  return self->_musicItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicItem, 0);
}

@end
