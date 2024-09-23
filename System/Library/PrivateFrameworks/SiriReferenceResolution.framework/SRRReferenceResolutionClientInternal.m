@implementation SRRReferenceResolutionClientInternal

- (SRRReferenceResolutionClientInternal)init
{
  return (SRRReferenceResolutionClientInternal *)ReferenceResolutionClientInternal.init()();
}

- (void)collectEntityStringsWithCompletion:(id)a3
{
  sub_2124C22C8(self, (int)a2, a3, (uint64_t)&unk_24CDC8BF0, (uint64_t)sub_2124C27D4, sub_2124C1008);
}

- (void)collectOnScreenEntityStringsWithCompletion:(id)a3
{
  sub_2124C22C8(self, (int)a2, a3, (uint64_t)&unk_24CDC8BC8, (uint64_t)sub_2124C25F0, sub_2124C1BAC);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
