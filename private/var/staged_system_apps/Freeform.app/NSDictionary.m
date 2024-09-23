@implementation NSDictionary

- (BOOL)crl_enumerateBoardItemNestedRecursivelyUsingBlock:(id)a3
{
  uint64_t (**v4)(id, NSDictionary *);
  unsigned __int8 v5;
  void *v6;

  v4 = (uint64_t (**)(id, NSDictionary *))a3;
  if ((v4[2](v4, self) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("groupChildren")));
    v5 = objc_msgSend(v6, "crl_enumerateAllBoardItemsNestedRecursivelyUsingBlock:", v4);

  }
  return v5;
}

@end
