@implementation PAEKeyerAutokeySetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEKeyerAutokeySetup)init
{
  PAEKeyerAutokeySetup *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEKeyerAutokeySetup;
  v2 = -[PAEKeyerAutokeySetup init](&v4, sel_init);
  if (v2)
    v2->_initialSamples = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerAutokeySetup;
  -[PAEKeyerAutokeySetup dealloc](&v3, sel_dealloc);
}

- (PAEKeyerAutokeySetup)initWithCoder:(id)a3
{
  PAEKeyerAutokeySetup *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAEKeyerAutokeySetup;
  v4 = -[PAEKeyerAutokeySetup init](&v8, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    -[PAEKeyerAutokeySetup setInitialSamples:](v4, "setInitialSamples:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("InitialSamples")));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_initialSamples, CFSTR("InitialSamples"));
}

- (id)initialSamples
{
  return self->_initialSamples;
}

- (void)setInitialSamples:(id)a3
{
  id v5;

  v5 = a3;

  self->_initialSamples = (NSMutableArray *)a3;
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  PAEKeyerAutokeySetup *v7;
  id *p_isa;

  v7 = objc_alloc_init(PAEKeyerAutokeySetup);
  if (a4 >= 1.0)
    p_isa = (id *)a3;
  else
    p_isa = (id *)&self->super.isa;
  v7->_initialSamples = (NSMutableArray *)objc_msgSend(p_isa[1], "mutableCopy");
  return v7;
}

@end
