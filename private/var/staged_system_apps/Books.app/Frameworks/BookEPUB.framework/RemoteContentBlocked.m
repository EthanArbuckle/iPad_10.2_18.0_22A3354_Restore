@implementation RemoteContentBlocked

+ (NSString)sourceName
{
  return (NSString *)CFSTR("RemoteContentBlocked.json");
}

+ (NSString)source
{
  return (NSString *)CFSTR("[\n  {\n    \"trigger\": {\n      \"url-filter\": \".*\",\n      \"load-type\": [\n        \"third-party\"\n      ]\n    },\n    \"action\": {\n      \"type\": \"block\"\n    }\n  },\n  {\n    \"trigger\": {\n      \"url-filter\": \"about:blank\"\n    },\n    \"action\": {\n      \"type\": \"ignore-previous-rules\"\n    }\n  },\n  {\n    \"trigger\": {\n      \"url-filter\": \"^ibooksimg?://.*\"\n    },\n    \"action\": {\n      \"type\": \"ignore-previous-rules\"\n    }\n  },\n  {\n    \"trigger\": {\n      \"url-filter\": \"^ibooks?://.*\"\n    },\n    \"action\": {\n      \"type\": \"ignore-previous-rules\"\n    }\n  }\n]\n\n");
}

@end
