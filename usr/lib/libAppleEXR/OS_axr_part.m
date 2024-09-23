@implementation OS_axr_part

- (NSString)debugDescription
{
  uint64_t v2;
  void *v3;
  EncoderPart *v4;
  objc_super v6;
  char __str[4096];
  uint64_t v8;

  v2 = MEMORY[0x24BDAC7A8](self, a2);
  v3 = (void *)v2;
  v8 = *MEMORY[0x24BDAC8D0];
  if (v2)
    v4 = (EncoderPart *)(v2 + 16);
  else
    v4 = 0;
  __str[0] = 0;
  EncoderPart::Print(v4, __str, 0xFFFuLL);
  v6.receiver = v3;
  v6.super_class = (Class)OS_axr_part;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%s"), -[OS_axr_part debugDescription](&v6, sel_debugDescription), __str);
}

- (NSString)description
{
  return (NSString *)CFSTR("axr_part_t");
}

- (void)dealloc
{
  objc_super v3;

  EncoderPart::~EncoderPart((EncoderPart *)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_axr_part;
  -[OS_axr_part dealloc](&v3, sel_dealloc);
}

@end
