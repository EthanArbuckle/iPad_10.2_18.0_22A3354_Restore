@implementation SPProactiveTopic

+ (id)proactiveTopicWithResult:(id)a3
{
  id v3;
  SPProactiveTopic *v4;
  void *v5;
  SPProactiveTopic *v6;

  v3 = a3;
  v4 = [SPProactiveTopic alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFLocalTopic initWithResult:identifier:](v4, "initWithResult:identifier:", v3, v5);

  return v6;
}

@end
