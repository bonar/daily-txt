# Daily::Txt

daily-txt is command line script for creating and listing text files that has a filename with current date.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daily-txt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daily-txt

## Usage

```
$ daily-txt
```

A command above creates text file at /${ROOT}/text/{$YYYY}/{$MM}/${YYYY}_${MM}_${DD}.txt
and open it with default editor. If it already exists, just open it for appending.

### Initialize

daily-txt command asks ROOT directory and default editor at initial startup, and stores
setting to ~/.daily-txt.rc.

```
$ daily-txt

Document Root? (/Document/daily-txt/): 
Default Editor? (/usr/bin/vim): 

Setting stored to ~/.daily-txt.rc
```

### Listing

List text files

```
$ daily-txt -l

/your/root/text/2016/04/2016_04_23.txt
/your/root/text/2016/04/2016_04_24.txt
/your/root/text/2016/04/2016_05_04.txt
```

### Open past files

```
daily-txt -p 1
daily-txt -p 2
daily-txt -p 3
```

### Search

```
$ daily-txt -s {search text}
```

### STDIN redirect 

```
$ cat memo.txt | daily-txt -t "useful memo"
```

insers STDIN input to text file for today with timestamp.

```
[2016/04/19 14:01:35 useful memo]------
this is memo
this is memo
---------------------------
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/daily-txt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

