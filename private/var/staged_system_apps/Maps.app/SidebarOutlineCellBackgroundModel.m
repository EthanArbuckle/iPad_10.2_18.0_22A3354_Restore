@implementation SidebarOutlineCellBackgroundModel

- (SidebarOutlineCellBackgroundModel)initWithStyle:(int64_t)a3 dropStyle:(int64_t)a4 grouping:(int64_t)a5 collectionViewFocused:(BOOL)a6 collectionViewProxyFocused:(BOOL)a7 collectionViewHasDropSession:(BOOL)a8
{
  SidebarOutlineCellBackgroundModel *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SidebarOutlineCellBackgroundModel;
  result = -[SidebarOutlineCellBackgroundModel init](&v15, "init");
  if (result)
  {
    result->_style = a3;
    result->_dropStyle = a4;
    result->_grouping = a5;
    result->_collectionViewFocused = a6;
    result->_collectionViewProxyFocused = a7;
    result->_collectionViewHasDropSession = a8;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_grouping ^ self->_style;
}

- (BOOL)isEqual:(id)a3
{
  SidebarOutlineCellBackgroundModel *v4;
  SidebarOutlineCellBackgroundModel *v5;
  uint64_t v6;
  SidebarOutlineCellBackgroundModel *v7;
  BOOL v8;

  v4 = (SidebarOutlineCellBackgroundModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = -[SidebarOutlineCellBackgroundModel style](v7, "style") == self->_style
      && -[SidebarOutlineCellBackgroundModel dropStyle](v7, "dropStyle") == self->_dropStyle
      && -[SidebarOutlineCellBackgroundModel grouping](v7, "grouping") == self->_grouping
      && self->_collectionViewFocused == -[SidebarOutlineCellBackgroundModel collectionViewFocused](v7, "collectionViewFocused")&& self->_collectionViewProxyFocused == -[SidebarOutlineCellBackgroundModel collectionViewProxyFocused](v7, "collectionViewProxyFocused")&& self->_collectionViewHasDropSession == -[SidebarOutlineCellBackgroundModel collectionViewHasDropSession](v7, "collectionViewHasDropSession");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)dropStyle
{
  return self->_dropStyle;
}

- (int64_t)grouping
{
  return self->_grouping;
}

- (BOOL)collectionViewFocused
{
  return self->_collectionViewFocused;
}

- (BOOL)collectionViewProxyFocused
{
  return self->_collectionViewProxyFocused;
}

- (BOOL)collectionViewHasDropSession
{
  return self->_collectionViewHasDropSession;
}

@end
