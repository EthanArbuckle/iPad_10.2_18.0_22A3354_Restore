@implementation PFStoryConcreteMotionStyleTable

- (PFStoryConcreteMotionStyleTable)initWithMotionStylesByColorGrade:(id)a3 defaultFrequencies:(id)a4
{
  id v7;
  id v8;
  PFStoryConcreteMotionStyleTable *v9;
  void **p_defaultFrequencies;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PFStoryConcreteMotionStyleTable;
  v9 = -[PFStoryConcreteMotionStyleTable init](&v16, sel_init);
  objc_storeStrong((id *)&v9->_motionStylesByColorGrade, a3);
  p_defaultFrequencies = (void **)&v9->_defaultFrequencies;
  objc_storeStrong((id *)&v9->_defaultFrequencies, a4);
  if (!v9->_defaultFrequencies)
  {
    v11 = 4;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    do
    {
      objc_msgSend(v12, "addObject:", &unk_1E45CA070);
      --v11;
    }
    while (v11);
    v13 = objc_msgSend(v12, "copy");

    v14 = *p_defaultFrequencies;
    *p_defaultFrequencies = (void *)v13;

  }
  return v9;
}

- (id)motionStylesForColorGrade:(id)a3 songPace:(int64_t)a4
{
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;

  v7 = self->_defaultFrequencies;
  -[NSDictionary objectForKeyedSubscript:](self->_motionStylesByColorGrade, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;

      v7 = v11;
    }

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFrequencies, 0);
  objc_storeStrong((id *)&self->_motionStylesByColorGrade, 0);
}

@end
