@implementation GEORPSuggestionEntry

- (id)initWithType:(int)a3
{
  uint64_t v3;
  GEORPSuggestionEntry *v4;
  GEORPSuggestionEntry *v5;

  v3 = *(_QWORD *)&a3;
  v4 = -[GEORPSuggestionEntry init](self, "init");
  v5 = v4;
  if (v4)
    -[GEORPSuggestionEntry setType:](v4, "setType:", v3);
  return v5;
}

- (void)safeAddDisplayLine:(id)a3
{
  if (a3)
    -[GEORPSuggestionEntry addDisplayLine:](self, "addDisplayLine:");
}

@end
