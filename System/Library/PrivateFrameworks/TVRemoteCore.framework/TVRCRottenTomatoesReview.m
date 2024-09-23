@implementation TVRCRottenTomatoesReview

+ (TVRCRottenTomatoesReview)rottenTomatoesReviewWithDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void (**v8)(_QWORD, _QWORD);
  TVRCRottenTomatoesReview *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke;
  v23[3] = &unk_24DCD6DD8;
  v5 = v3;
  v24 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x220746068](v23);
  v18 = v4;
  v19 = 3221225472;
  v20 = __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke_2;
  v21 = &unk_24DCD6E00;
  v22 = v5;
  v7 = v5;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x220746068](&v18);
  v9 = objc_alloc_init(TVRCRottenTomatoesReview);
  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("tomatometerPercentage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setPercentage:](v9, "setPercentage:", v10, v18, v19, v20, v21);

  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("audienceScore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setAudienceScore:](v9, "setAudienceScore:", v11);

  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("averageRating"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setAverageRating:](v9, "setAverageRating:", v12);

  ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("consensus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setConsensus:](v9, "setConsensus:", v13);

  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("numFreshReviews"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setNumberOfFreshReviews:](v9, "setNumberOfFreshReviews:", v14);

  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("numRottenReviews"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setNumberOfRottenReviews:](v9, "setNumberOfRottenReviews:", v15);

  ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("tomatometerFreshness"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setFreshness:](v9, "setFreshness:", v16);

  return v9;
}

id __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "stringValue");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v3 = v2;
LABEL_6:
  v4 = v3;
LABEL_8:

  return v4;
}

id __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0.0;
      if (objc_msgSend(v4, "scanDouble:", &v6))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }

    }
LABEL_8:
    v3 = 0;
    goto LABEL_9;
  }
  v3 = v2;
LABEL_9:

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[TVRCRottenTomatoesReview isEqualToRottenTomatoesReview:](self, "isEqualToRottenTomatoesReview:", v4);

  return v5;
}

- (BOOL)isEqualToRottenTomatoesReview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;

  v4 = a3;
  -[TVRCRottenTomatoesReview percentage](self, "percentage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "percentage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 == 0) ^ (v6 == 0);

  if ((v7 & 1) != 0)
    goto LABEL_22;
  -[TVRCRottenTomatoesReview audienceScore](self, "audienceScore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audienceScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v8 == 0) ^ (v9 == 0);

  if ((v10 & 1) != 0)
    goto LABEL_22;
  -[TVRCRottenTomatoesReview averageRating](self, "averageRating");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "averageRating");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (v11 == 0) ^ (v12 == 0);

  if ((v13 & 1) != 0)
    goto LABEL_22;
  -[TVRCRottenTomatoesReview consensus](self, "consensus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consensus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (v14 == 0) ^ (v15 == 0);

  if ((v16 & 1) != 0)
    goto LABEL_22;
  -[TVRCRottenTomatoesReview numberOfFreshReviews](self, "numberOfFreshReviews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfFreshReviews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (v17 == 0) ^ (v18 == 0);

  if ((v19 & 1) != 0)
    goto LABEL_22;
  -[TVRCRottenTomatoesReview numberOfRottenReviews](self, "numberOfRottenReviews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfRottenReviews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (v20 == 0) ^ (v21 == 0);

  if ((v22 & 1) != 0)
    goto LABEL_22;
  -[TVRCRottenTomatoesReview freshness](self, "freshness");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "freshness");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (v23 == 0) ^ (v24 == 0);

  if ((v25 & 1) != 0)
    goto LABEL_22;
  -[TVRCRottenTomatoesReview percentage](self, "percentage");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[TVRCRottenTomatoesReview percentage](self, "percentage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "percentage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqualToNumber:", v29);

    if (!v30)
      goto LABEL_22;
  }
  -[TVRCRottenTomatoesReview audienceScore](self, "audienceScore");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[TVRCRottenTomatoesReview audienceScore](self, "audienceScore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audienceScore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqualToNumber:", v34);

    if (!v35)
      goto LABEL_22;
  }
  -[TVRCRottenTomatoesReview averageRating](self, "averageRating");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[TVRCRottenTomatoesReview averageRating](self, "averageRating");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "averageRating");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqualToNumber:", v39);

    if (!v40)
      goto LABEL_22;
  }
  -[TVRCRottenTomatoesReview consensus](self, "consensus");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[TVRCRottenTomatoesReview consensus](self, "consensus");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consensus");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqualToString:", v44);

    if (!v45)
      goto LABEL_22;
  }
  -[TVRCRottenTomatoesReview numberOfFreshReviews](self, "numberOfFreshReviews");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[TVRCRottenTomatoesReview numberOfFreshReviews](self, "numberOfFreshReviews");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberOfFreshReviews");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqualToNumber:", v49);

    if (!v50)
      goto LABEL_22;
  }
  -[TVRCRottenTomatoesReview numberOfRottenReviews](self, "numberOfRottenReviews");
  v51 = objc_claimAutoreleasedReturnValue();
  if (!v51)
    goto LABEL_20;
  v52 = (void *)v51;
  -[TVRCRottenTomatoesReview numberOfRottenReviews](self, "numberOfRottenReviews");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfRottenReviews");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v53, "isEqualToNumber:", v54);

  if (!v55)
  {
LABEL_22:
    v60 = 0;
  }
  else
  {
LABEL_20:
    -[TVRCRottenTomatoesReview freshness](self, "freshness");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v57 = (void *)v56;
      -[TVRCRottenTomatoesReview freshness](self, "freshness");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "freshness");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqualToString:", v59);

    }
    else
    {
      v60 = 1;
    }
  }

  return v60;
}

- (unint64_t)freshnessLevel
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[TVRCRottenTomatoesReview freshness](self, "freshness");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CertifiedFresh"));

  if ((v4 & 1) != 0)
    return 1;
  -[TVRCRottenTomatoesReview freshness](self, "freshness");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Rotten"));

  if (v7)
    return 3;
  else
    return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TVRCRottenTomatoesReview *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(TVRCRottenTomatoesReview);
  -[TVRCRottenTomatoesReview percentage](self, "percentage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setPercentage:](v4, "setPercentage:", v5);

  -[TVRCRottenTomatoesReview audienceScore](self, "audienceScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setAudienceScore:](v4, "setAudienceScore:", v6);

  -[TVRCRottenTomatoesReview averageRating](self, "averageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setAverageRating:](v4, "setAverageRating:", v7);

  -[TVRCRottenTomatoesReview consensus](self, "consensus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setConsensus:](v4, "setConsensus:", v8);

  -[TVRCRottenTomatoesReview numberOfFreshReviews](self, "numberOfFreshReviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setNumberOfFreshReviews:](v4, "setNumberOfFreshReviews:", v9);

  -[TVRCRottenTomatoesReview numberOfRottenReviews](self, "numberOfRottenReviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setNumberOfRottenReviews:](v4, "setNumberOfRottenReviews:", v10);

  -[TVRCRottenTomatoesReview freshness](self, "freshness");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRottenTomatoesReview setFreshness:](v4, "setFreshness:", v11);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCRottenTomatoesReview)initWithCoder:(id)a3
{
  id v4;
  TVRCRottenTomatoesReview *v5;
  uint64_t v6;
  NSNumber *percentage;
  uint64_t v8;
  NSNumber *audienceScore;
  uint64_t v10;
  NSNumber *averageRating;
  uint64_t v12;
  NSString *consensus;
  uint64_t v14;
  NSNumber *numberOfFreshReviews;
  uint64_t v16;
  NSNumber *numberOfRottenReviews;
  uint64_t v18;
  NSString *freshness;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TVRCRottenTomatoesReview;
  v5 = -[TVRCRottenTomatoesReview init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("percentage"));
    v6 = objc_claimAutoreleasedReturnValue();
    percentage = v5->_percentage;
    v5->_percentage = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audienceScore"));
    v8 = objc_claimAutoreleasedReturnValue();
    audienceScore = v5->_audienceScore;
    v5->_audienceScore = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageRating"));
    v10 = objc_claimAutoreleasedReturnValue();
    averageRating = v5->_averageRating;
    v5->_averageRating = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("consensus"));
    v12 = objc_claimAutoreleasedReturnValue();
    consensus = v5->_consensus;
    v5->_consensus = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfFreshReviews"));
    v14 = objc_claimAutoreleasedReturnValue();
    numberOfFreshReviews = v5->_numberOfFreshReviews;
    v5->_numberOfFreshReviews = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfRottenReviews"));
    v16 = objc_claimAutoreleasedReturnValue();
    numberOfRottenReviews = v5->_numberOfRottenReviews;
    v5->_numberOfRottenReviews = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("freshness"));
    v18 = objc_claimAutoreleasedReturnValue();
    freshness = v5->_freshness;
    v5->_freshness = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *percentage;
  id v5;

  percentage = self->_percentage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", percentage, CFSTR("percentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audienceScore, CFSTR("audienceScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageRating, CFSTR("averageRating"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_consensus, CFSTR("consensus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfFreshReviews, CFSTR("numberOfFreshReviews"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfRottenReviews, CFSTR("numberOfRottenReviews"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_freshness, CFSTR("freshness"));

}

- (NSNumber)percentage
{
  return self->_percentage;
}

- (void)setPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_percentage, a3);
}

- (NSNumber)audienceScore
{
  return self->_audienceScore;
}

- (void)setAudienceScore:(id)a3
{
  objc_storeStrong((id *)&self->_audienceScore, a3);
}

- (NSNumber)averageRating
{
  return self->_averageRating;
}

- (void)setAverageRating:(id)a3
{
  objc_storeStrong((id *)&self->_averageRating, a3);
}

- (NSString)consensus
{
  return self->_consensus;
}

- (void)setConsensus:(id)a3
{
  objc_storeStrong((id *)&self->_consensus, a3);
}

- (NSNumber)numberOfFreshReviews
{
  return self->_numberOfFreshReviews;
}

- (void)setNumberOfFreshReviews:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfFreshReviews, a3);
}

- (NSNumber)numberOfRottenReviews
{
  return self->_numberOfRottenReviews;
}

- (void)setNumberOfRottenReviews:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfRottenReviews, a3);
}

- (NSString)freshness
{
  return self->_freshness;
}

- (void)setFreshness:(id)a3
{
  objc_storeStrong((id *)&self->_freshness, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshness, 0);
  objc_storeStrong((id *)&self->_numberOfRottenReviews, 0);
  objc_storeStrong((id *)&self->_numberOfFreshReviews, 0);
  objc_storeStrong((id *)&self->_consensus, 0);
  objc_storeStrong((id *)&self->_averageRating, 0);
  objc_storeStrong((id *)&self->_audienceScore, 0);
  objc_storeStrong((id *)&self->_percentage, 0);
}

@end
