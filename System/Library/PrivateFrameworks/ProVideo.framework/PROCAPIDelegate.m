@implementation PROCAPIDelegate

- (void)plugInManager:(id)a3 didLoadPlugIn:(id)a4
{
  ((void (*)(id, void *))self->callback)(a4, self->userData);
}

@end
