@implementation VUIDocumentContextDataMovie

- (VUIDocumentContextDataMovie)initWithMovieID:(id)a3
{
  id v5;
  VUIDocumentContextDataMovie *v6;
  VUIDocumentContextDataMovie *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentContextDataMovie;
  v6 = -[VUIDocumentContextDataMovie init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_movieID, a3);

  return v7;
}

- (id)jsonData
{
  NSString *movieID;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  movieID = self->_movieID;
  v4[0] = CFSTR("id");
  v4[1] = CFSTR("type");
  v5[0] = movieID;
  v5[1] = CFSTR("Movie");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VUIDocumentContextDataMovie movieID](self, "movieID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "movieID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)movieID
{
  return self->_movieID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieID, 0);
}

@end
