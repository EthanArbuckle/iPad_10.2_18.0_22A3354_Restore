@implementation FLTMutableCDMCATISwiftBloomFilter

- (FLTMutableCDMCATISwiftBloomFilter)init
{
  FLTMutableCDMCATISwiftBloomFilter *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FLTMutableCDMCATISwiftBloomFilter;
  v2 = -[FLTMutableCDMCATISwiftBloomFilter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary copy](self->super._storage, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FLTCDMCATISwiftBitVector)bit_vector
{
  return (FLTCDMCATISwiftBitVector *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("bit_vector"));
}

- (void)setBit_vector:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (unint64_t)number_of_bits
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("number_of_bits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (void)setNumber_of_bits:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (unint64_t)number_of_hashes
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("number_of_hashes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (void)setNumber_of_hashes:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (unint64_t)seed
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("seed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (void)setSeed:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (unsigned)expected_number_of_items
{
  void *v2;
  unsigned int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("expected_number_of_items"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setExpected_number_of_items:(unsigned int)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (double)false_positive_rate
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("false_positive_rate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setFalse_positive_rate:(double)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSString)name
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (unsigned)number_of_items
{
  void *v2;
  unsigned int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("number_of_items"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setNumber_of_items:(unsigned int)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (unsigned)expected_items_buffer
{
  void *v2;
  unsigned int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("expected_items_buffer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setExpected_items_buffer:(unsigned int)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
