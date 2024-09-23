@implementation AWDCoreRoutineLearnedLocationTrainingMetrics(RTLearnedLocationEngineTrainingMetrics)

- (id)initWithLearnedLocationEngineMetrics:()RTLearnedLocationEngineTrainingMetrics
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = (objc_class *)MEMORY[0x1E0DDD138];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "maxIntervalBetweenLocations");
  objc_msgSend(v6, "setMaxIntervalBetweenLocations:", (unint64_t)v7);
  objc_msgSend(v5, "intervalSinceLastAttempt");
  objc_msgSend(v6, "setIntervalSinceLastAttempt:", (unint64_t)v8);
  objc_msgSend(v5, "latency");
  objc_msgSend(v6, "setLatency:", (unint64_t)v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "locationsProcessed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocationsProcessed:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "placeCountDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceCountDevice:", objc_msgSend(v11, "unsignedIntValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "placeCountTotal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceCountTotal:", objc_msgSend(v12, "unsignedIntValue"));

  objc_msgSend(v5, "awdPlaces");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaces:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "visitCountDevice"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVisitCountDevice:", objc_msgSend(v14, "unsignedIntValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "visitCountTotal"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVisitCountTotal:", objc_msgSend(v15, "unsignedIntValue"));

  objc_msgSend(v5, "awdVisits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVisits:", v16);

  v17 = objc_msgSend(v5, "trainedVisits");
  objc_msgSend(v6, "setTrainedVisits:", v17);

  return v6;
}

@end
