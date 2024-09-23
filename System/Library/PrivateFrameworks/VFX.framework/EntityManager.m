@implementation EntityManager

- (void)_applicationDidEnterBackground:(id)a3
{
  sub_1B1E7413C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B1E7104C);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  sub_1B1E7413C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B1E7113C);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  sub_1B1E7413C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B1E7104C);
}

- (void)_sceneWillEnterForeground:(id)a3
{
  sub_1B1E7413C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B1E7113C);
}

@end
