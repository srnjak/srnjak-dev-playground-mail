# srnjak-dev-playground-mail Docker Image

This Docker image is an extension of the `srnjak-dev-playground` image, providing additional support for sending emails from the bash console using Postfix and Mailutils.

## Usage

### Building the Image

```bash
docker build -t srnjak-dev-playground-mail .
```

### Running a Container

To run the container, you can use either the `--env-file` option or the `-e` flag to specify environment variables directly. 
Below are examples for both methods:

#### Using `--env-file`:

```bash
docker run --env-file env.list -it srnjak-dev-playground-mail
```

Ensure that you have an `env.list` file containing the necessary environment variables for email configuration, including `RELAY_HOST`, `USERNAME`, and `PASSWORD`. Here is an example `env.list` file:

```plaintext
RELAY_HOST="[mail.example.com]:465"
USERNAME="your_username"
PASSWORD="your_password"
```

#### Using `-e`:

```bash
docker run -e RELAY_HOST="[mail.example.com]:465" -e USERNAME="your_username" -e PASSWORD="your_password" -it srnjak-dev-playground-mail
```

Replace the values in quotes with your specific configuration details.

### Sending a Test Email

Once the container is running, you can send a test email using the following command:

```bash
echo "Test message" | mail -s "Test" -a "From: sender@example.com" recipient@example.com
```

Replace `recipient@example.com` with the desired recipient's email address, and update the `"From: sender@example.com"` to specify the desired sender's email address.

## Dependencies

- Based on the `srnjak-dev-playground` image
- Postfix
- Mailutils

## Docker Hub
The Docker image is available on Docker Hub:
- [srnjak/srnjak-dev-playground-mail](https://hub.docker.com/r/srnjak/srnjak-dev-playground-mail)

## License

This Docker image is licensed under the [MIT License](LICENSE).
