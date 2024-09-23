@implementation ATXLocationManagerKnownLOIs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CLLocation *Home;
  id v5;

  Home = self->Home;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", Home, CFSTR("Home"));
  objc_msgSend(v5, "encodeObject:forKey:", self->Work, CFSTR("Work"));
  objc_msgSend(v5, "encodeObject:forKey:", self->School, CFSTR("School"));
  objc_msgSend(v5, "encodeObject:forKey:", self->Gym, CFSTR("Gym"));

}

- (ATXLocationManagerKnownLOIs)initWithCoder:(id)a3
{
  id v4;
  ATXLocationManagerKnownLOIs *v5;
  uint64_t v6;
  CLLocation *Home;
  uint64_t v8;
  CLLocation *Work;
  uint64_t v10;
  CLLocation *School;
  uint64_t v12;
  CLLocation *Gym;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXLocationManagerKnownLOIs;
  v5 = -[ATXLocationManagerKnownLOIs init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Home"));
    v6 = objc_claimAutoreleasedReturnValue();
    Home = v5->Home;
    v5->Home = (CLLocation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Work"));
    v8 = objc_claimAutoreleasedReturnValue();
    Work = v5->Work;
    v5->Work = (CLLocation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("School"));
    v10 = objc_claimAutoreleasedReturnValue();
    School = v5->School;
    v5->School = (CLLocation *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Gym"));
    v12 = objc_claimAutoreleasedReturnValue();
    Gym = v5->Gym;
    v5->Gym = (CLLocation *)v12;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->Gym, 0);
  objc_storeStrong((id *)&self->School, 0);
  objc_storeStrong((id *)&self->Work, 0);
  objc_storeStrong((id *)&self->Home, 0);
}

@end
