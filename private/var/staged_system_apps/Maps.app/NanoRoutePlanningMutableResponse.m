@implementation NanoRoutePlanningMutableResponse

- (void)setObject:(id)a3 forUserInfoKey:(id)a4 forRouteID:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NanoRoutePlanningMutableResponse;
  -[NanoRoutePlanningResponse setObject:forUserInfoKey:forRouteID:](&v5, "setObject:forUserInfoKey:forRouteID:", a3, a4, a5);
}

- (void)copyFrom:(id)a3
{
  objc_msgSend(a3, "_populateCopy:", self);
}

@end
