@implementation WhatDidTheySayIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (WhatDidTheySayIntent)init
{
  return (WhatDidTheySayIntent *)WhatDidTheySayIntent.init()();
}

- (WhatDidTheySayIntent)initWithCoder:(id)a3
{
  id v3;
  WhatDidTheySayIntent *result;

  v3 = a3;
  WhatDidTheySayIntent.init(coder:)();
  return result;
}

- (WhatDidTheySayIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  WhatDidTheySayIntent *result;

  if (a3)
  {
    v5 = sub_2249ECDD4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  WhatDidTheySayIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (WhatDidTheySayIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECD68();
  return (WhatDidTheySayIntent *)WhatDidTheySayIntent.init(domain:verb:parametersByName:)();
}

@end
