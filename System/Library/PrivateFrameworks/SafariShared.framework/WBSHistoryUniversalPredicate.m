@implementation WBSHistoryUniversalPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;

  if (a5 != 11)
    return 0;
  objc_msgSend(a4, "statementForQuery:error:", CFSTR("SELECT history_items.*,history_visits.* FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item AND history_visits.id = safari_latest_visit_for (history_items.id)"), a6, v6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WBSHistoryUniversalPredicate)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WBSHistoryUniversalPredicate;
  return -[WBSHistoryUniversalPredicate init](&v4, sel_init, a3);
}

- (BOOL)evaluateVisit:(id)a3
{
  return 1;
}

- (BOOL)evaluateServiceVisit:(id)a3
{
  return 1;
}

@end
