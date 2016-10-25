# Daily::Txt

daily-txt is command line script for creating and listing text files that has a filename with current date.

## Usage

```
$ daily-txt
```

The command above creates text file at /${ROOT}/text/{$YYYY}/{$MM}/${YYYY}_${MM}_${DD}.txt
and open it with default editor. If it already exists, just open it for editing.

### Initialize

At initial startup, daily-txt command asks ROOT directory and default editor. And it stores
setting to ~/.daily-txt.rc.

```
$ daily-txt

Document Root? (/Document/daily-txt/): 
Default Editor? (/usr/bin/vim): 

Setting stored to ~/.daily-txt.rc
```

### Open past file

-p 1 for yesterday, -p 2 for the day before yesterday.

```
$ daily-txt -p 1
```

### Listing

List text files

```
$ daily-txt -l

/your/root/text/2016/04/2016_04_23.txt
/your/root/text/2016/04/2016_04_24.txt
/your/root/text/2016/04/2016_05_04.txt
```

### Search files with text

```
$ daily-txt -s "search query"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daily-txt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daily-txt


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/daily-txt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

