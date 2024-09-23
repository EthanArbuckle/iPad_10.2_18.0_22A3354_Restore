@implementation RCCloudRecording

+ (id)savedRecordingURIForSearchableItemIdentifier:(id)a3
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", a3);
}

+ (id)searchableItemIdentifierForSavedRecordingURI:(id)a3
{
  return objc_msgSend(a3, "absoluteString");
}

@end
