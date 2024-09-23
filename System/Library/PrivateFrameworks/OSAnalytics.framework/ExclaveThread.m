@implementation ExclaveThread

- (void)addStackEntries:(id)a3
{
  id v4;
  NSMutableArray *stackEntries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stackEntries = self->_stackEntries;
  v8 = v4;
  if (!stackEntries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stackEntries;
    self->_stackEntries = v6;

    v4 = v8;
    stackEntries = self->_stackEntries;
  }
  -[NSMutableArray addObject:](stackEntries, "addObject:", v4);

}

- (NSMutableArray)stackEntries
{
  return self->_stackEntries;
}

- (void)setStackEntries:(id)a3
{
  objc_storeStrong((id *)&self->_stackEntries, a3);
}

- (NSNumber)schedulingContextId
{
  return self->_schedulingContextId;
}

- (void)setSchedulingContextId:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingContextId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulingContextId, 0);
  objc_storeStrong((id *)&self->_stackEntries, 0);
}

@end
