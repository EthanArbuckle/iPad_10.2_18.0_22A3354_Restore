@implementation SPUnknownProductMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPUnknownProductMetadata *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  SPUnknownProductMetadata *v14;

  v4 = [SPUnknownProductMetadata alloc];
  -[SPUnknownProductMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnknownProductMetadata moreDescription](self, "moreDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnknownProductMetadata percentageX](self, "percentageX");
  v8 = v7;
  -[SPUnknownProductMetadata percentageY](self, "percentageY");
  v10 = v9;
  -[SPUnknownProductMetadata image](self, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnknownProductMetadata image2x](self, "image2x");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnknownProductMetadata image3x](self, "image3x");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SPUnknownProductMetadata initWithTitle:description:percentageX:percentageY:image:image2x:image3x:](v4, "initWithTitle:description:percentageX:percentageY:image:image2x:image3x:", v5, v6, v11, v12, v13, v8, v10);

  return v14;
}

- (SPUnknownProductMetadata)initWithTitle:(id)a3 description:(id)a4 percentageX:(double)a5 percentageY:(double)a6 image:(id)a7 image2x:(id)a8 image3x:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  SPUnknownProductMetadata *v21;
  SPUnknownProductMetadata *v22;
  id v24;
  objc_super v25;

  v24 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SPUnknownProductMetadata;
  v21 = -[SPUnknownProductMetadata init](&v25, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_title, a3);
    objc_storeStrong((id *)&v22->_moreDescription, a4);
    v22->_percentageX = a5;
    v22->_percentageY = a6;
    objc_storeStrong((id *)&v22->_image, a7);
    objc_storeStrong((id *)&v22->_image2x, a8);
    objc_storeStrong((id *)&v22->_image3x, a9);
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_moreDescription, CFSTR("moreDescription"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageX"), self->_percentageX);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageY"), self->_percentageY);
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image2x, CFSTR("image2x"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image3x, CFSTR("image3x"));

}

- (SPUnknownProductMetadata)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *moreDescription;
  double v12;
  double v13;
  NSURL *v14;
  NSURL *image;
  NSURL *v16;
  NSURL *image2x;
  NSURL *v18;
  NSURL *image3x;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("moreDescription"));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  moreDescription = self->_moreDescription;
  self->_moreDescription = v10;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageX"));
  self->_percentageX = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageY"));
  self->_percentageY = v13;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image2x"));
  v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
  image2x = self->_image2x;
  self->_image2x = v16;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image3x"));
  v18 = (NSURL *)objc_claimAutoreleasedReturnValue();

  image3x = self->_image3x;
  self->_image3x = v18;

  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPUnknownProductMetadata percentageX](self, "percentageX");
  v6 = v5;
  -[SPUnknownProductMetadata percentageY](self, "percentageY");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %.06f/%.06f>"), v4, self, v6, v7);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)moreDescription
{
  return self->_moreDescription;
}

- (void)setMoreDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)percentageX
{
  return self->_percentageX;
}

- (void)setPercentageX:(double)a3
{
  self->_percentageX = a3;
}

- (double)percentageY
{
  return self->_percentageY;
}

- (void)setPercentageY:(double)a3
{
  self->_percentageY = a3;
}

- (NSURL)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)image2x
{
  return self->_image2x;
}

- (void)setImage2x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)image3x
{
  return self->_image3x;
}

- (void)setImage3x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image3x, 0);
  objc_storeStrong((id *)&self->_image2x, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_moreDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
