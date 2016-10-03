# Magic Formula Investing website

I read [Little Book that Still Beats the Market](https://www.amazon.com/Little-Book-Still-Beats-Market/dp/0470624159), it references https://www.magicformulainvesting.com as an companion site. I found the site awkward to work with; I couldn't click on the results to copy/paste them, etc.

So I wrote this little app to fetch the results and display them as a table to the terminal.

```
+----------------------------------+--------+------------+------------+--------------------------+
| Name                             | Ticket | Market Cap | Price From | Most Recent Quarter Data |
+----------------------------------+--------+------------+------------+--------------------------+
| Accretive Health Inc             | ACHI   | 261.62     | 09/30      | 06/30                    |
| Argan Inc                        | AGX    | 889.74     | 09/30      | 07/31                    |
| Avid Technology Inc.             | AVID   | 316.18     | 09/30      | 06/30                    |
| Barrett Business Services Inc    | BBSI   | 357.69     | 09/30      | 06/30                    |
| BP Prudhoe Bay Royalty Trust     | BPT    | 399.32     | 09/30      | 06/30                    |
| Capella Education Co             | CPLA   | 673.67     | 09/30      | 06/30                    |
| Cherokee Inc                     | CHKE   | 89.73      | 09/30      | 07/31                    |
| Cisco Systems Inc                | CSCO   | 158,790.30 | 09/30      | 07/31                    |
| Deluxe Corp                      | DLX    | 3,258.14   | 09/30      | 06/30                    |
```

To use, setup your email/password as environment variables:

```
export MAGICFORMULA_EMAIL=<email>
export MAGICFORMULA_PASSWORD=<password>
```

And run the CLI:

```
magicformulainvesting
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drnic/magicformulainvesting. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
