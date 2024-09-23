@implementation SXComponentScrollPosition

- (SXComponentScrollPosition)initWithComponentIdentifier:(id)a3 canvasWidth:(double)a4 relativePageOffset:(double)a5
{
  id v9;
  SXComponentScrollPosition *v10;
  SXComponentScrollPosition *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXComponentScrollPosition;
  v10 = -[SXComponentScrollPosition init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_componentIdentifier, a3);
    v11->_canvasWidth = a4;
    v11->_relativePageOffset = a5;
  }

  return v11;
}

- (SXComponentScrollPosition)initWithCoder:(id)a3
{
  id v4;
  SXComponentScrollPosition *v5;
  uint64_t v6;
  NSString *componentIdentifier;
  float v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXComponentScrollPosition;
  v5 = -[SXScrollPosition initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("componentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("canvasWidth"));
    v5->_canvasWidth = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("relativePageOffset"));
    v5->_relativePageOffset = v9;
  }

  return v5;
}

+ (BOOL)jsonDictionaryRepresentationIsValid:(id)a3 exactly:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") == 3;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("componentIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("canvasWidth"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relativePageOffset"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v10 != 0;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (SXComponentScrollPosition)initWithDictionaryRepresentation:(id)a3 exactly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  SXComponentScrollPosition *v13;
  SXComponentScrollPosition *v14;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "jsonDictionaryRepresentationIsValid:exactly:", v6, v4))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("componentIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("canvasWidth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relativePageOffset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = -[SXComponentScrollPosition initWithComponentIdentifier:canvasWidth:relativePageOffset:](self, "initWithComponentIdentifier:canvasWidth:relativePageOffset:", v7, v10, v12);

    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  -[SXComponentScrollPosition componentIdentifier](self, "componentIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v12[0] = v3;
    v11[0] = CFSTR("componentIdentifier");
    v11[1] = CFSTR("canvasWidth");
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[SXComponentScrollPosition canvasWidth](self, "canvasWidth");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    v11[2] = CFSTR("relativePageOffset");
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[SXComponentScrollPosition relativePageOffset](self, "relativePageOffset");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  -[SXComponentScrollPosition componentIdentifier](self, "componentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("componentIdentifier"));

  -[SXComponentScrollPosition canvasWidth](self, "canvasWidth");
  *(float *)&v5 = v5;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("canvasWidth"), v5);
  -[SXComponentScrollPosition relativePageOffset](self, "relativePageOffset");
  *(float *)&v6 = v6;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("relativePageOffset"), v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (double)relativePageOffset
{
  return self->_relativePageOffset;
}

- (double)canvasWidth
{
  return self->_canvasWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end
