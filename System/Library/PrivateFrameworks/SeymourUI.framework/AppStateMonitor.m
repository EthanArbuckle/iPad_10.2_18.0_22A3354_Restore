@implementation AppStateMonitor

- (void)publishAppWillEnterForeground
{
  sub_22B0F19A0((uint64_t)self, (uint64_t)a2, 0xD00000000000001FLL, 0x800000022BAD39B0, (void (*)(void))sub_22B116734);
}

- (void)publishAppDidBecomeActive
{
  sub_22B0F19A0((uint64_t)self, (uint64_t)a2, 0xD00000000000001BLL, 0x800000022BAD39D0, (void (*)(void))sub_22B118D94);
}

- (void)publishAppWillResignActive
{
  sub_22B0F19A0((uint64_t)self, (uint64_t)a2, 0xD00000000000001CLL, 0x800000022BAD3990, (void (*)(void))sub_22B116E68);
}

- (void)publishAppDidEnterBackground
{
  sub_22B0F19A0((uint64_t)self, (uint64_t)a2, 0xD00000000000001ELL, 0x800000022BAD3970, (void (*)(void))sub_22B363CA0);
}

- (void)publishAppWillTerminate
{
  sub_22B0F19A0((uint64_t)self, (uint64_t)a2, 0xD000000000000019, 0x800000022BAD3950, (void (*)(void))sub_22B363C5C);
}

- (void)publishSignificantTimeChanged
{
  sub_22B0F19A0((uint64_t)self, (uint64_t)a2, 0xD00000000000001FLL, 0x800000022BAD3930, (void (*)(void))sub_22B106B20);
}

@end
