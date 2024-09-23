@implementation MPModelForYouRecommendationItem

- (NSString)title
{
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (char *)-[MPModelForYouRecommendationItem itemType](self, "itemType");
  if (v3 == (_BYTE *)&dword_0 + 3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelForYouRecommendationItem radioStation](self, "radioStation"));
LABEL_7:
    v4 = v6;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    goto LABEL_8;
  }
  if (v3 == (_BYTE *)&dword_0 + 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelForYouRecommendationItem playlist](self, "playlist"));
    goto LABEL_7;
  }
  if (v3 != (_BYTE *)&dword_0 + 1)
  {
    v7 = 0;
    return (NSString *)v7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelForYouRecommendationItem album](self, "album"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
LABEL_8:
  v7 = (void *)v5;

  return (NSString *)v7;
}

@end
