@implementation BSUIScreenshot

- (BSUIScreenshot)initWithDictionary:(id)a3
{
  id v4;
  BSUIScreenshot *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *url;

  v4 = a3;
  v5 = -[BSUIScreenshot init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width")));
    v10 = 0.0;
    v11 = 0.0;
    if ((objc_opt_respondsToSelector(v6, "integerValue", v8) & 1) != 0)
      v11 = (double)(uint64_t)objc_msgSend(v6, "integerValue");
    if ((objc_opt_respondsToSelector(v7, "integerValue", v9) & 1) != 0)
      v10 = (double)(uint64_t)objc_msgSend(v7, "integerValue");
    v5->_size.width = v10;
    v5->_size.height = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artworkUrl")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "jsa_normalizedArtworkURLOfSize:withFormat:", CFSTR("jpg"), v5->_size.width, v5->_size.height));
    v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
    url = v5->_url;
    v5->_url = (NSURL *)v14;

  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p size={%g, %g} url=%@>"), objc_opt_class(self, a2), self, *(_QWORD *)&self->_size.width, *(_QWORD *)&self->_size.height, self->_url);
}

- (NSURL)url
{
  return self->_url;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
