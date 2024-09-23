@implementation MeCardService

- (void)clearCachedMeCard
{
  void *v2;

  v2 = *(void **)self->cachedMeCard;
  *(_QWORD *)self->cachedMeCard = 0;

}

@end
