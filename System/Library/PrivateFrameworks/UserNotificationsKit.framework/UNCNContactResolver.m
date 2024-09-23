@implementation UNCNContactResolver

uint64_t __48___UNCNContactResolver_bestMatchForPhoneNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchThatMatchesPhoneNumber:forContact:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __49___UNCNContactResolver_bestMatchForEmailAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchThatMatchesEmailAddress:forContact:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __67___UNCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchThatMatchesSocialProfile:bundleIdentifier:forContact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

@end
