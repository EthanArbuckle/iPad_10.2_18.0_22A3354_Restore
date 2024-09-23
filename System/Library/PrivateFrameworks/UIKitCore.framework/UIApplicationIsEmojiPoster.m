@implementation UIApplicationIsEmojiPoster

void ___UIApplicationIsEmojiPoster_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC8005 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"));

}

@end
