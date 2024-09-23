@implementation PKDashboardPassTilesItem

+ (id)identifier
{
  return CFSTR("tiles");
}

- (NSArray)tiles
{
  return (NSArray *)-[PKPassTile tiles](self->_groupTile, "tiles");
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKPassTile)groupTile
{
  return self->_groupTile;
}

- (void)setGroupTile:(id)a3
{
  objc_storeStrong((id *)&self->_groupTile, a3);
}

- (unint64_t)maximumRowsOverride
{
  return self->_maximumRowsOverride;
}

- (void)setMaximumRowsOverride:(unint64_t)a3
{
  self->_maximumRowsOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupTile, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
