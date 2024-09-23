@implementation REMGrocerySuggestedSection

- (REMGrocerySuggestedSection)initWithLabelIndex:(int64_t)a3 sectionCanonicalName:(id)a4 confidenceScore:(float)a5
{
  id v9;
  REMGrocerySuggestedSection *v10;
  REMGrocerySuggestedSection *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)REMGrocerySuggestedSection;
  v10 = -[REMGrocerySuggestedSection init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_labelIndex = a3;
    objc_storeStrong((id *)&v10->_sectionCanonicalName, a4);
    v11->_confidenceScore = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  float v15;
  float v16;
  float v17;

  if (a3 != self)
  {
    v4 = a3;
    v5 = objc_opt_class();
    REMDynamicCast(v5, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[REMGrocerySuggestedSection labelIndex](self, "labelIndex");
    if (v7 == objc_msgSend(v6, "labelIndex"))
    {
      -[REMGrocerySuggestedSection sectionCanonicalName](self, "sectionCanonicalName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sectionCanonicalName");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 == (void *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        -[REMGrocerySuggestedSection sectionCanonicalName](self, "sectionCanonicalName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionCanonicalName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_5;
      }
      -[REMGrocerySuggestedSection confidenceScore](self, "confidenceScore");
      v16 = v15;
      objc_msgSend(v6, "confidenceScore");
      v14 = vabds_f32(v16, v17) <= 0.00000011921;
      goto LABEL_9;
    }
LABEL_5:
    v14 = 0;
LABEL_9:

    return v14;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[REMGrocerySuggestedSection labelIndex](self, "labelIndex");
  -[REMGrocerySuggestedSection sectionCanonicalName](self, "sectionCanonicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMGrocerySuggestedSection confidenceScore](self, "confidenceScore");
  v7 = (void *)objc_msgSend(v4, "initWithLabelIndex:sectionCanonicalName:confidenceScore:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[REMGrocerySuggestedSection labelIndex](self, "labelIndex"), CFSTR("labelIndex"));
  -[REMGrocerySuggestedSection sectionCanonicalName](self, "sectionCanonicalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("sectionCanonicalName"));

  -[REMGrocerySuggestedSection confidenceScore](self, "confidenceScore");
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("confidenceScore"));

}

- (REMGrocerySuggestedSection)initWithCoder:(id)a3
{
  id v4;
  REMGrocerySuggestedSection *v5;
  uint64_t v6;
  NSString *sectionCanonicalName;
  float v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMGrocerySuggestedSection;
  v5 = -[REMGrocerySuggestedSection init](&v10, sel_init);
  if (v5)
  {
    v5->_labelIndex = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("labelIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionCanonicalName"));
    v6 = objc_claimAutoreleasedReturnValue();
    sectionCanonicalName = v5->_sectionCanonicalName;
    v5->_sectionCanonicalName = (NSString *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidenceScore"));
    v5->_confidenceScore = v8;
  }

  return v5;
}

- (int64_t)labelIndex
{
  return self->_labelIndex;
}

- (NSString)sectionCanonicalName
{
  return self->_sectionCanonicalName;
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionCanonicalName, 0);
}

@end
