@implementation CLIArguments

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_arguments, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_arguments, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)consumeUpToIndex:(int64_t)a3
{
  int64_t v5;
  void *v6;

  v5 = -[NSArray count](self->_arguments, "count");
  if (v5 <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[NSArray subarrayWithRange:](self->_arguments, "subarrayWithRange:", a3, v5 - a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->_arguments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
}

@end
