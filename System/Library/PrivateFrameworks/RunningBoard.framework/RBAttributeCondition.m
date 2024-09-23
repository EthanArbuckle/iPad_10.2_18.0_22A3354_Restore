@implementation RBAttributeCondition

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_value)
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| name:%@ value:%@>"), v4, self->_name, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
