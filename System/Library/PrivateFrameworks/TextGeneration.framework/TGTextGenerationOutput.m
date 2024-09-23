@implementation TGTextGenerationOutput

- (TGTextGenerationOutput)initWithText:(id)a3 score:(double)a4
{
  id v7;
  TGTextGenerationOutput *v8;
  TGTextGenerationOutput *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *description;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TGTextGenerationOutput;
  v8 = -[TGTextGenerationOutput init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_text, a3);
    v9->_score = a4;
    v16[0] = CFSTR("text");
    v16[1] = CFSTR("score");
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = objc_claimAutoreleasedReturnValue();
    description = v9->_description;
    v9->_description = (NSString *)v12;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[TGTextGenerationOutput text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TGTextGenerationOutput score](self, "score");
      v10 = v9;
      objc_msgSend(v6, "score");
      v12 = v10 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[TGTextGenerationOutput text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[TGTextGenerationOutput score](self, "score");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v4;

  return v7;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
