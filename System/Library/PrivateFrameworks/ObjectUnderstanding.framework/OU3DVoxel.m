@implementation OU3DVoxel

- (OU3DVoxel)init
{
  OU3DVoxel *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OU3DVoxel;
  v2 = -[OU3DVoxel init](&v4, sel_init);
  -[OU3DVoxel setCenter:](v2, "setCenter:", 0.0);
  -[OU3DVoxel setSize:](v2, "setSize:", 0.0);
  -[OU3DVoxel setSemantic_label:](v2, "setSemantic_label:", 0);
  -[OU3DVoxel setObject_id:](v2, "setObject_id:", 0);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __objc2_class *v4;

  v4 = -[__objc2_class init](OU3DVoxel, "init");
  *(_OWORD *)&v4->info = *(_OWORD *)self->center;
  *(_OWORD *)&v4[1].superclass = *(_OWORD *)self->size;
  LOBYTE(v4->superclass) = self->semantic_label;
  objc_storeStrong(&v4->cache, self->object_id);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 semantic_label;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->center, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("location"));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->size, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("size"));
  semantic_label = self->semantic_label;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &semantic_label, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("semantic_label"));
  objc_msgSend(v4, "encodeObject:forKey:", self->object_id, CFSTR("object_id"));

}

- (OU3DVoxel)initWithCoder:(id)a3
{
  id v4;
  OU3DVoxel *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSUUID *object_id;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OU3DVoxel;
  v5 = -[OU3DVoxel init](&v12, sel_init);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_OWORD *)v5->center = *(_OWORD *)objc_msgSend(v6, "bytes");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_OWORD *)v5->size = *(_OWORD *)objc_msgSend(v7, "bytes");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("semantic_label"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5->semantic_label = *(_BYTE *)objc_msgSend(v8, "bytes");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("object_id"));
  v9 = objc_claimAutoreleasedReturnValue();
  object_id = v5->object_id;
  v5->object_id = (NSUUID *)v9;

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSUUID *object_id;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  float3ToNSArray(*(__n128 *)self->center);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("location"));

  float3ToNSArray(*(__n128 *)self->size);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("size"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->semantic_label);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("semantic_label"));

  object_id = self->object_id;
  if (object_id)
  {
    -[NSUUID UUIDString](self->object_id, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("object_id"));
  if (object_id)

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (OU3DVoxel)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  OU3DVoxel *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUUID *object_id;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OU3DVoxel;
  v5 = -[OU3DVoxel init](&v17, sel_init);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
    float3FromNSArray(v7, v5->center);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
    float3FromNSArray(v9, v5->size);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_label"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (v11)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->semantic_label = objc_msgSend(v12, "intValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("object_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
    object_id = v5->object_id;
    v5->object_id = (NSUUID *)v14;
  }
  else
  {
    object_id = v5->object_id;
    v5->object_id = 0;
  }

  return v5;
}

- (__n128)center
{
  return a1[2];
}

- (void)setCenter:(OU3DVoxel *)self
{
  __int128 v2;

  *(_OWORD *)self->center = v2;
}

- (__n128)size
{
  return a1[3];
}

- (void)setSize:(OU3DVoxel *)self
{
  __int128 v2;

  *(_OWORD *)self->size = v2;
}

- (unsigned)semantic_label
{
  return self->semantic_label;
}

- (void)setSemantic_label:(unsigned __int8)a3
{
  self->semantic_label = a3;
}

- (NSUUID)object_id
{
  return self->object_id;
}

- (void)setObject_id:(id)a3
{
  objc_storeStrong((id *)&self->object_id, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->object_id, 0);
}

@end
