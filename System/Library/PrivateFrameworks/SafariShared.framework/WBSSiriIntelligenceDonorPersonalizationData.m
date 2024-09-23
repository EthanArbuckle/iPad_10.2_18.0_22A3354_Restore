@implementation WBSSiriIntelligenceDonorPersonalizationData

- (void)clearData
{
  -[WBSSiriIntelligenceDonorPersonalizationData setSearchQuery:](self, "setSearchQuery:", 0);
  -[WBSSiriIntelligenceDonorPersonalizationData setPosition:](self, "setPosition:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSearchQuery:", self->_searchQuery);
  objc_msgSend(v4, "setPosition:", self->_position);
  return v4;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end
