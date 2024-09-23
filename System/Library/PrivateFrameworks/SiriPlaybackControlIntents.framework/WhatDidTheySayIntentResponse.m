@implementation WhatDidTheySayIntentResponse

- (int64_t)code
{
  return sub_2249D9958();
}

- (void)setCode:(int64_t)a3
{
  sub_2249D99C0(a3);
}

- (WhatDidTheySayIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (WhatDidTheySayIntentResponse *)WhatDidTheySayIntentResponse.init(code:userActivity:)(a3, a4);
}

- (WhatDidTheySayIntentResponse)init
{
  return (WhatDidTheySayIntentResponse *)WhatDidTheySayIntentResponse.init()();
}

- (WhatDidTheySayIntentResponse)initWithCoder:(id)a3
{
  id v3;
  WhatDidTheySayIntentResponse *result;

  v3 = a3;
  WhatDidTheySayIntentResponse.init(coder:)();
  return result;
}

- (WhatDidTheySayIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  WhatDidTheySayIntentResponse *result;

  v3 = a3;
  WhatDidTheySayIntentResponse.init(backingStore:)();
  return result;
}

- (WhatDidTheySayIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  WhatDidTheySayIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  WhatDidTheySayIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
