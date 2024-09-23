@implementation ImagePerformanceRecorder

- (void)onImageWillLoad:(id)a3
{
  sub_1D974C534((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D974C5DC);
}

- (void)onImageDidLoad:(id)a3
{
  sub_1D974C534((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D974C85C);
}

@end
