@implementation SBModifierCacheCoordinator

- (void)performResponse:(unint64_t)a3
{
  if (a3 <= 2)
    *(Class *)((char *)&self->super.isa + qword_1D0E8A410[a3]) = (Class)(*(char **)((char *)&self->super.isa
                                                                                  + qword_1D0E8A410[a3])
                                                                       + qword_1D0E8A428[a3]);
}

@end
