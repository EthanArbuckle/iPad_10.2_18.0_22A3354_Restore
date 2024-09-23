@implementation PXVmlState

- (id)legacyTextGlobals
{
  return self->mLegacyTextGlobals;
}

- (void)setLegacyTextGlobals:(id)a3
{
  objc_storeStrong((id *)&self->mLegacyTextGlobals, a3);
}

- (id)legacyPresentationState
{
  return self->mLegacyPresentationState;
}

- (void)setLegacyPresentationState:(id)a3
{
  objc_storeStrong((id *)&self->mLegacyPresentationState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLegacyPresentationState, 0);
  objc_storeStrong((id *)&self->mLegacyTextGlobals, 0);
}

@end
